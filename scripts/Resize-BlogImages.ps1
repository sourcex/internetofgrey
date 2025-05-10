# Image Resizing Script for Blog Content
# This script resizes images to approximately match blog header and card sizes while preserving aspect ratio

param(
    [Parameter(Mandatory=$true)]
    [string]$Folder,
    
    [Parameter(Mandatory=$false)]
    [int]$HeaderWidth = 1200,
    
    [Parameter(Mandatory=$false)]
    [int]$HeaderHeight = 630,
    
    [Parameter(Mandatory=$false)]
    [int]$CardWidth = 400,
    
    [Parameter(Mandatory=$false)]
    [int]$CardHeight = 300
)

# Add required assembly for image manipulation
Add-Type -AssemblyName System.Drawing

# Function to calculate dimensions that preserve aspect ratio
function Get-PreservedAspectRatioDimensions {
    param (
        [int]$originalWidth,
        [int]$originalHeight,
        [int]$targetWidth,
        [int]$targetHeight
    )
    
    $widthRatio = $targetWidth / $originalWidth
    $heightRatio = $targetHeight / $originalHeight
    
    # Use the smaller ratio to ensure the image maintains aspect ratio
    $ratio = [Math]::Min($widthRatio, $heightRatio)
    
    $newWidth = [int]($originalWidth * $ratio)
    $newHeight = [int]($originalHeight * $ratio)
    
    return @{
        Width = $newWidth
        Height = $newHeight
    }
}

# Process each image in the folder
$imageFiles = Get-ChildItem -Path $Folder -Include "*.jpg","*.jpeg","*.png","*.gif" -Recurse -File |
              Where-Object { -not ($_.Name -like "*_header*" -or $_.Name -like "*_card*") }

foreach ($file in $imageFiles) {
    try {
        # Load the image
        $image = [System.Drawing.Image]::FromFile($file.FullName)
        
        # Determine if we need to convert from PNG to JPG
        $isPng = $file.Extension -eq ".png"
        
        # Get filename without extension and create new filenames with suffixes
        $nameWithoutExt = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
        $headerFileName = if ($isPng) { "$nameWithoutExt`_header.jpg" } else { "$nameWithoutExt`_header$($file.Extension)" }
        $cardFileName = if ($isPng) { "$nameWithoutExt`_card.jpg" } else { "$nameWithoutExt`_card$($file.Extension)" }
        
        # Create paths to save the new images in the same directory
        $headerPath = Join-Path -Path $file.DirectoryName -ChildPath $headerFileName
        $cardPath = Join-Path -Path $file.DirectoryName -ChildPath $cardFileName
        
        # Calculate dimensions for header image that preserve aspect ratio
        $headerDimensions = Get-PreservedAspectRatioDimensions -originalWidth $image.Width -originalHeight $image.Height -targetWidth $HeaderWidth -targetHeight $HeaderHeight
        
        # Create header size image with preserved aspect ratio
        $headerBitmap = New-Object System.Drawing.Bitmap($headerDimensions.Width, $headerDimensions.Height)
        $headerGraphics = [System.Drawing.Graphics]::FromImage($headerBitmap)
        $headerGraphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $headerGraphics.DrawImage($image, 0, 0, $headerDimensions.Width, $headerDimensions.Height)
        
        # Save header image
        if ($isPng) {
            # Save as JPG with quality setting
            $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
            $qualityParam = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, 90L)
            $encoderParams.Param[0] = $qualityParam
            $jpegCodecInfo = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
            $headerBitmap.Save($headerPath, $jpegCodecInfo, $encoderParams)
        } else {
            $headerBitmap.Save($headerPath, $image.RawFormat)
        }
        
        # Calculate dimensions for card image that preserve aspect ratio
        $cardDimensions = Get-PreservedAspectRatioDimensions -originalWidth $image.Width -originalHeight $image.Height -targetWidth $CardWidth -targetHeight $CardHeight
        
        # Create card size image with preserved aspect ratio
        $cardBitmap = New-Object System.Drawing.Bitmap($cardDimensions.Width, $cardDimensions.Height)
        $cardGraphics = [System.Drawing.Graphics]::FromImage($cardBitmap)
        $cardGraphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $cardGraphics.DrawImage($image, 0, 0, $cardDimensions.Width, $cardDimensions.Height)
        
        # Save card image
        if ($isPng) {
            # Save as JPG with quality setting
            $cardBitmap.Save($cardPath, $jpegCodecInfo, $encoderParams)
        } else {
            $cardBitmap.Save($cardPath, $image.RawFormat)
        }
        
        # Cleanup
        $headerGraphics.Dispose()
        $cardGraphics.Dispose()
        $headerBitmap.Dispose()
        $cardBitmap.Dispose()
        $image.Dispose()
        
        Write-Host "Processed: $($file.Name) -> Created $headerFileName (${$headerDimensions.Width}x${$headerDimensions.Height}) and $cardFileName (${$cardDimensions.Width}x${$cardDimensions.Height})"
    }
    catch {
        Write-Error "Error processing $($file.Name): $_"
    }
}

Write-Host "Resizing complete. All images saved in their original directories with appropriate suffixes."