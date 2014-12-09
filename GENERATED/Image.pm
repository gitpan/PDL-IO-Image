
#
# GENERATED WITH PDL::PP! Don't modify!
#
package PDL::IO::Image;

@EXPORT_OK  = qw( wimage rimage );
%EXPORT_TAGS = (Func=>[@EXPORT_OK]);

use PDL::Core;
use PDL::Exporter;
use DynaLoader;



   $PDL::IO::Image::VERSION = 0.001;
   @ISA    = ( 'PDL::Exporter','DynaLoader' );
   push @PDL::Core::PP, __PACKAGE__;
   bootstrap PDL::IO::Image $VERSION;








use strict;
use warnings;
use Carp;

###XXX FIXME
#sub import {
#  my $package = shift;
#  {
#    no strict 'refs';
#    *{'PDL::wimage'} = \&PDL::IO::Image::wimage;### if grep { /^(:all|wimage)$/ } @_;
#  }
#  __PACKAGE__->export_to_level(1, $package, @_) if @_;
#}

{
  no strict 'refs';
  *{'PDL::wimage'} = \&PDL::IO::Image::wimage;### if grep { /^(:all|wimage)$/ } @_;
}

sub _val2list {
  return @{$_[0]} if ref $_[0] eq 'ARRAY';
  return $_[0];
};

sub rimage {
  my $options = ref $_[-1] eq 'HASH' ? pop : {};
  my $filename = shift;
  $options->{format} = "AUTO" unless defined $options->{format};
  $options->{format_flag} = 0 unless defined $options->{format_flag};
  $options->{page} = 0        unless defined $options->{page};
  my $pimage = PDL::IO::Image->new_from_file($filename, $options->{format}, $options->{format_flag}, $options->{page});

  if (my $flip = $options->{flip}) {
    $pimage->flip_horizontal if $flip =~ /H/;
    $pimage->flip_vertical   if $flip =~ /V/;
  }
  if (defined $options->{convert_image_type}) {
    $pimage->convert_image_type(_val2list($options->{convert_image_type}));
  }

  $options->{region} = [] unless ref $options->{region} eq 'ARRAY';
  if ($options->{palette}) {
    return ($pimage->pixels_to_pdl(@{$options->{region}}), $pimage->palette_to_pdl);
  }
  return $pimage->pixels_to_pdl(@{$options->{region}});
}

sub wimage {
  my $options = ref $_[-1] eq 'HASH' ? pop : {};
  my ($pixels, $filename) = @_;
  my $palette = $options->{palette} if ref $options->{palette} eq 'PDL';
  my $pimage = defined $palette ?
               PDL::IO::Image->new_from_pdl($pixels, $palette) :
               PDL::IO::Image->new_from_pdl($pixels);

  if (my $flip = $options->{flip}) {
    $pimage->flip_horizontal if $flip =~ /H/;
    $pimage->flip_vertical   if $flip =~ /V/;
  }
  if (defined $options->{rotate}) {
    $pimage->rotate(_val2list($options->{rotate}));
  }
  if (defined $options->{rescale}) {
    $pimage->rescale(_val2list($options->{rescale}));
  }
  if (defined $options->{rescale_pct}) {
    $pimage->rescale_pct(_val2list($options->{rescale_pct}));
  }
  if (defined $options->{convert_image_type}) {
    $pimage->convert_image_typeconvert_image_type(_val2list($options->{convert_image_type}));
  }

  $options->{format} = "AUTO" unless defined $options->{format};
  $options->{format_flag} = 0 unless defined $options->{format_flag};
  $pimage->save($filename, $options->{format}, $options->{format_flag});
  return $pixels;
}



### Constants

sub BMP_SAVE_RLE() { (constant('BMP_SAVE_RLE'))[1] }

sub EXR_FLOAT() { (constant('EXR_FLOAT'))[1] }

sub EXR_NONE() { (constant('EXR_NONE'))[1] }

sub EXR_ZIP() { (constant('EXR_ZIP'))[1] }

sub EXR_PIZ() { (constant('EXR_PIZ'))[1] }

sub EXR_PXR24() { (constant('EXR_PXR24'))[1] }

sub EXR_B44() { (constant('EXR_B44'))[1] }

sub EXR_LC() { (constant('EXR_LC'))[1] }

sub GIF_LOAD256() { (constant('GIF_LOAD256'))[1] }

sub GIF_PLAYBACK() { (constant('GIF_PLAYBACK'))[1] }

sub ICO_MAKEALPHA() { (constant('ICO_MAKEALPHA'))[1] }

sub JPEG_FAST() { (constant('JPEG_FAST'))[1] }

sub JPEG_ACCURATE() { (constant('JPEG_ACCURATE'))[1] }

sub JPEG_CMYK() { (constant('JPEG_CMYK'))[1] }

sub JPEG_EXIFROTATE() { (constant('JPEG_EXIFROTATE'))[1] }

sub JPEG_GREYSCALE() { (constant('JPEG_GREYSCALE'))[1] }

sub JPEG_QUALITYSUPERB() { (constant('JPEG_QUALITYSUPERB'))[1] }

sub JPEG_QUALITYGOOD() { (constant('JPEG_QUALITYGOOD'))[1] }

sub JPEG_QUALITYNORMAL() { (constant('JPEG_QUALITYNORMAL'))[1] }

sub JPEG_QUALITYAVERAGE() { (constant('JPEG_QUALITYAVERAGE'))[1] }

sub JPEG_QUALITYBAD() { (constant('JPEG_QUALITYBAD'))[1] }

sub JPEG_PROGRESSIVE() { (constant('JPEG_PROGRESSIVE'))[1] }

sub JPEG_SUBSAMPLING_411() { (constant('JPEG_SUBSAMPLING_411'))[1] }

sub JPEG_SUBSAMPLING_420() { (constant('JPEG_SUBSAMPLING_420'))[1] }

sub JPEG_SUBSAMPLING_422() { (constant('JPEG_SUBSAMPLING_422'))[1] }

sub JPEG_SUBSAMPLING_444() { (constant('JPEG_SUBSAMPLING_444'))[1] }

sub JPEG_OPTIMIZE() { (constant('JPEG_OPTIMIZE'))[1] }

sub JPEG_BASELINE() { (constant('JPEG_BASELINE'))[1] }

sub PCD_BASE() { (constant('PCD_BASE'))[1] }

sub PCD_BASEDIV4() { (constant('PCD_BASEDIV4'))[1] }

sub PCD_BASEDIV16() { (constant('PCD_BASEDIV16'))[1] }

sub PNG_IGNOREGAMMA() { (constant('PNG_IGNOREGAMMA'))[1] }

sub PNG_Z_BEST_SPEED() { (constant('PNG_Z_BEST_SPEED'))[1] }

sub PNG_Z_DEFAULT_COMPRESSION() { (constant('PNG_Z_DEFAULT_COMPRESSION'))[1] }

sub PNG_Z_BEST_COMPRESSION() { (constant('PNG_Z_BEST_COMPRESSION'))[1] }

sub PNG_Z_NO_COMPRESSION() { (constant('PNG_Z_NO_COMPRESSION'))[1] }

sub PNG_INTERLACED() { (constant('PNG_INTERLACED'))[1] }

sub PNM_SAVE_ASCII() { (constant('PNM_SAVE_ASCII'))[1] }

sub PSD_CMYK() { (constant('PSD_CMYK'))[1] }

sub PSD_LAB() { (constant('PSD_LAB'))[1] }

sub RAW_PREVIEW() { (constant('RAW_PREVIEW'))[1] }

sub RAW_DISPLAY() { (constant('RAW_DISPLAY'))[1] }

sub RAW_HALFSIZE() { (constant('RAW_HALFSIZE'))[1] }

sub TARGA_LOAD_RGB888() { (constant('TARGA_LOAD_RGB888'))[1] }

sub TARGA_SAVE_RLE() { (constant('TARGA_SAVE_RLE'))[1] }

sub TIFF_CMYK() { (constant('TIFF_CMYK'))[1] }

sub TIFF_PACKBITS() { (constant('TIFF_PACKBITS'))[1] }

sub TIFF_DEFLATE() { (constant('TIFF_DEFLATE'))[1] }

sub TIFF_ADOBE_DEFLATE() { (constant('TIFF_ADOBE_DEFLATE'))[1] }

sub TIFF_NONE() { (constant('TIFF_NONE'))[1] }

sub TIFF_CCITTFAX3() { (constant('TIFF_CCITTFAX3'))[1] }

sub TIFF_CCITTFAX4() { (constant('TIFF_CCITTFAX4'))[1] }

sub TIFF_LZW() { (constant('TIFF_LZW'))[1] }

sub TIFF_JPEG() { (constant('TIFF_JPEG'))[1] }

sub TIFF_LOGLUV() { (constant('TIFF_LOGLUV'))[1] }

sub WEBP_LOSSLESS() { (constant('WEBP_LOSSLESS'))[1] }

sub JXR_LOSSLESS() { (constant('JXR_LOSSLESS'))[1] }

sub JXR_PROGRESSIVE() { (constant('JXR_PROGRESSIVE'))[1] }

=head1 NAME

PDL::IO::Image - Load/save bitmap from/to PDL (via FreeImage library)

=head1 SYNOPSIS

Functional interface:

 use 5.010;
 use PDL;
 use PDL::IO::Image;
 
 my $pdl1 = rimage('picture.tiff');
 say $pdl1->info;       # PDL: Byte D [400,300] ... width 400, height 300
 # do some hacking with $piddle
 wimage($pdl1, 'output.tiff');
 # you can use wimage as PDL's method
 $pdl1->wimage('another-output.png');
  
 my ($pixels, $palette) = rimage('picture-256colors.gif', { palette=>1 });
 say $pixels->info;     # PDL: Byte D [400,300] ... width 400, height 300
 say $palette->info;    # PDL: Byte D [3,256]
 # do some hacking with $pixels and $palette
 wimage($pixels, 'output.gif', { palette=>$palette });
  
 # load specific image (page) from multi-page file
 my $pdl2 = rimage('picture.tiff', { page=>0 });
  
 # load specific image + flit vertically before converting to piddle
 my $pdl3 = rimage('picture.tiff', { flip=>'V' });
 
 # random pixels + ramdom colors (RGBA - 35 bits per pixel)
 (random(400, 300, 4) * 256)->byte->wimage("random.png");
 
 my $pix1 = (sin(0.25 * rvals(101, 101)) * 128 + 127)->byte;
 say $pix1->info;       # PDL: Byte D [101,101]
 my $pal1 = yvals(3, 256)->byte;
 $pal1->slice("(2),:") .= 0; # set blue part of palette to zero
 say $pal1->info;       # PDL: Byte D [3,256]
 $pix1->wimage("wave1_grayscale.gif"); # default is grayscale palette
 $pix1->wimage("wave2_yellow.gif", { palette=>$pal1 });
 
 # rotate /rescale before saving
 my $pix2 = (sin(0.25 * xvals(101, 101)) * 128 + 127)->byte;
 $pix2->wimage("wave3_grayscale.gif", { rotate=>33.33, rescale=>[16,16] }); # rescale to 16x16 pixels
 $pix2->wimage("wave4_grayscale.gif", { rescale_pct=>50 }); # rescale to 50%

Object oriented (OO) interface:
 
 use 5.010;
 use PDL;
 use PDL::IO::Image;
 
 # create PDL::IO::Image object from file
 my $pimage1 = PDL::IO::Image->new_from_file('picture.gif');
 say 'width       = ' . $pimage1->get_width;
 say 'height      = ' . $pimage1->get_height;
 say 'image_type  = ' . $pimage1->get_image_type;
 say 'color_type  = ' . $pimage1->get_color_type;
 say 'colors_used = ' . $pimage1->get_colors_used;
 say 'bpp         = ' . $pimage1->get_bpp;
 # you can do some operations with PDL::IO::Image object
 $pimage1->flip_vertical;
 # export pixels from PDL::IO::Image object content into a piddle
 my $pix_pdl = $pimage1->pixels_to_pdl();
 # export palette from PDL::IO::Image object content into a piddle
 my $pal_pdl = $pimage1->palette_to_pdl();
 
 # create PDL::IO::Image object from PDL data
 my $wave_pixels = (sin(0.008 * xvals(2001, 2001)) * 128 + 127)->byte;
 # here you can do some other tricks with $wave_pixels
 my $pimage2 = PDL::IO::Image->new_from_pdl($wave_pixels);
 # do some transformation with PDL::IO::Image object
 $pimage2->rotate(45);
 $pimage2->rescale(200, 200);
 # export PDL::IO::Image object content into a image file
 $pimage2->save("output.jpg");

=head1 DESCRIPTION

XXX

=head2 Supported file formats

This module supports loading (L</new_from_file> or L</rimage>) and saving (L</save> or L</wimage>)
of the following formats (note that not all formats suppors writing - see C<R/W> column).

    BMP  R/W  Windows or OS/2 Bitmap [extensions: bmp]
    ICO  R/W  Windows Icon [extensions: ico]
   JPEG  R/W  JPEG - JFIF Compliant [extensions: jpg,jif,jpeg,jpe]
    JNG  R/W  JPEG Network Graphics [extensions: jng]
  KOALA  R/-  C64 Koala Graphics [extensions: koa]
    IFF  R/-  IFF Interleaved Bitmap [extensions: iff,lbm]
    MNG  R/-  Multiple-image Network Graphics [extensions: mng]
    PBM  R/W  Portable Bitmap (ASCII) [extensions: pbm]
 PBMRAW  R/W  Portable Bitmap (RAW) [extensions: pbm]
    PCD  R/-  Kodak PhotoCD [extensions: pcd]
    PCX  R/-  Zsoft Paintbrush [extensions: pcx]
    PGM  R/W  Portable Greymap (ASCII) [extensions: pgm]
 PGMRAW  R/W  Portable Greymap (RAW) [extensions: pgm]
    PNG  R/W  Portable Network Graphics [extensions: png]
    PPM  R/W  Portable Pixelmap (ASCII) [extensions: ppm]
 PPMRAW  R/W  Portable Pixelmap (RAW) [extensions: ppm]
    RAS  R/-  Sun Raster Image [extensions: ras]
  TARGA  R/W  Truevision Targa [extensions: tga,targa]
   TIFF  R/W  Tagged Image File Format [extensions: tif,tiff]
   WBMP  R/W  Wireless Bitmap [extensions: wap,wbmp,wbm]
    PSD  R/-  Adobe Photoshop [extensions: psd]
    CUT  R/-  Dr. Halo [extensions: cut]
    XBM  R/-  X11 Bitmap Format [extensions: xbm]
    XPM  R/W  X11 Pixmap Format [extensions: xpm]
    DDS  R/-  DirectX Surface [extensions: dds]
    GIF  R/W  Graphics Interchange Format [extensions: gif]
    HDR  R/W  High Dynamic Range Image [extensions: hdr]
     G3  R/-  Raw fax format CCITT G.3 [extensions: g3]
    SGI  R/-  SGI Image Format [extensions: sgi,rgb,rgba,bw]
    EXR  R/W  ILM OpenEXR [extensions: exr]
    J2K  R/W  JPEG-2000 codestream [extensions: j2k,j2c]
    JP2  R/W  JPEG-2000 File Format [extensions: jp2]
    PFM  R/W  Portable floatmap [extensions: pfm]
   PICT  R/-  Macintosh PICT [extensions: pct,pict,pic]
    RAW  R/-  RAW camera image [extensions: 3fr,arw,bay,bmq,cap,cine,
                  cr2,crw,cs1,dc2, dcr,drf,dsc,dng,erf,fff,ia,iiq,k25,
                  kc2,kdc,mdc,mef,mos,mrw,nef,nrw,orf,pef, ptx,pxn,qtk,
                  raf,raw,rdc,rw2,rwl,rwz,sr2,srf,srw,sti]
   WEBP  R/W  Google WebP image format [extensions: webp]
JPEG-XR  R/W  JPEG XR image format [extensions: jxr,wdp,hdp]

B<IMPORTANT> the strings in the first column (e.g. C<'BMP'>, C<'JPEG'>, C<'PNG'>) are used as a format identifier in
L</new_from_file>, L</save>, L</rimage>, L</wimage> (+some other methods).

The supported format may differ depending on freeimage library version. You can list what exactly you freeimage library
can handle like this:

 for (PDL::IO::Image->format_list) {
   my $r = PDL::IO::Image->format_can_read($_) ? 'R' : '-';
   my $w = PDL::IO::Image->format_can_write($_) ? 'W' : '-';
   my $e = PDL::IO::Image->format_extension_list($_);
   my $d = PDL::IO::Image->format_description($_);
   printf("% 7s  %s/%s  %s [extensions: %s]\n", $_, $r, $w, $d, $e);
 }

=head2 Supported image types

This module can handle the following image types.

 BITMAP   Standard image: 1-, 4-, 8-, 16-, 24-, 32-bit
 UINT16   Array of unsigned short: unsigned 16-bit
 INT16    Array of short: signed 16-bit
 UINT32   Array of unsigned long: unsigned 32-bit
 INT32    Array of long: signed 32-bit
 FLOAT    Array of float: 32-bit IEEE floating point
 DOUBLE   Array of double: 64-bit IEEE floating point
 RGB16    48-bit RGB image: 3 x 16-bit
 RGBA16   64-bit RGBA image: 4 x 16-bit
 RGBF     96-bit RGB float image: 3 x 32-bit IEEE floating point
 RGBAF    128-bit RGBA float image: 4 x 32-bit IEEE floating point

Currently B<NOT SUPPORTED>:

 COMPLEX  Array of FICOMPLEX: 2 x 64-bit IEEE floating point

Image type is important especially when you want to load image data from PDL piddle into a PDL::IO::Image object 
(and later save to a file). Based on piddle size and piddle type the image type is detected (in L</new_from_pdl>
and L</wimage>).

  <w>...image width
  <h>...image height
  PDL Byte    [<w>,<h>]         BITMAP 1-/4-/8-bits per pixel
  PDL Byte    [<w>,<h>,3]       BITMAP 24-bits per pixel (RGB)
  PDL Byte    [<w>,<h>,4]       BITMAP 32-bits per pixel (RGBA)    
  PDL Ushort  [<w>,<h>]         UINT16
  PDL Short   [<w>,<h>]         INT16
  PDL LongLong[<w>,<h>]         UINT32 (unfortunately there is no PDL Ulong type)
  PDL Long    [<w>,<h>]         INT32
  PDL Float   [<w>,<h>]         FLOAT
  PDL Double  [<w>,<h>]         DOUBLE
  PDL Ushort  [<w>,<h>,3]       RGB16
  PDL Ushort  [<w>,<h>,4]       RGBA16
  PDL Float   [<w>,<h>,3]       RGBf
  PDL Float   [<w>,<h>,4]       RGBAF
 
B<IMPORTANT> the strings with type name (e.g. C<'BITMAP'>, C<'UINT16'>, C<'RGBAF'>) are used as a image type 
identifier in mathod L</convert_image_type> and a return value of method L</get_image_type>.

Not all file formats support all imge formats above (especially those non-BITMAP image types). If you are in doubts use
C<tiff> format for storing unusual image types.

=head1 FUNCTIONS

The functional interface comprise of two functions L</rimage> and L</wimage> - both are exported by default.

=head2 rimage

Loads image into a PDL piddle (or into two piddles in case of pallete-based images).

 my $pixels_pdl = rimage($filename);
 #or
 my $pixels_pdl = rimage($filename, \%options);
 #or
 my ($pixels_pdl, $palette_pdl) = rimage($filename, { palette=>1 });

Internally it works in these steps:

=over

=item * Create PDL::IO::Image object from the input file.

=item * Do optional transformations (based on C<%options>) with PDL::IO::Image object object.

=item * Export PDL::IO::Image object into a piddle(s) via L</pixels_to_pdl> and L</palette_to_pdl>.

=item * B<IMPORTANT:> L</rimage> returns piddle(s) not a PDL::IO::Image object
  
=back

Items supported in B<options> hash:

=over

=item format

String identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">), default 
is C<'AUTO'> which means that format is auto detected.

=item format_flag

Optinal flag related to loading given file format - see L</new_from_file> method for more info.

=item page

Load specifig page from multi-page images (0-based index).

=item flip

Values C<'H'>, C<'V'> or C<'HV'> specifying horizontal, vertical or horizontal+vertical flipping. 
Default: do not flip.

=item convert_image_type

String identifying image type (e.g. C<'BITMAP'> - for valid values see <L/"Supported image types">). 
Default: no conversion.

=item region

An arrayref with a region specification like C<[$x1,$x2,$y1,$y2]> - see L</pixels_to_pdl> method for more info.
Default: create the output piddle from the whole image.

=item palette

Values C<0> (default) or C<1> - whether to load (or not) color lookup table (aka LUT).

=back

=head2 wimage

Write PDL piddle(s) into a image file.

 $pixels_pdl->wimage($filename);
 #or
 $pixels_pdl->wimage($filename, \%options);

 wimage($pixels_pdl, $filename);
 #or
 wimage($pixels_pdl, $filename, \%options);

Internally it works in these steps:

=over

=item * Create PDL::IO::Image object from the C<$pixels_piddle> (+ C<$palette_piddle> passed as C<palette> option).

=item * Dimensions and type of C<$pixels_piddle> must comply with L</"Supported image types">.

=item * Do optional transformations (based on C<%options>) with PDL::IO::Image object object.

=item * Export PDL::IO::Image object into a image file via L</save> method.
  
=back

Items supported in B<options> hash:

=over

=item * format

String identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">), default 
is C<'AUTO'> which means that format is auto detected from extension of C<$filename>.

=item * format_flag

Optinal flag related to saving given file format - see L</save> method for more info.

=item * palette

Optional PDL piddle with color palette (has to be C<PDL Byte[3,N]> where 0 < N <= 256) with RGB tripplets.

=item * flip

Values C<'H'>, C<'V'> or C<'HV'> specifying horizontal, vertical or horizontal+vertical flipping. 
Default: do not flip.

=item * rotate

Optional floating point value with rotation angle (in degrees) - see L</rotate> method for more info.
Default: do not rotate.

=item * rescale

Optional array ref with rescale specification (in pixels) e.g. C<[$new_w, $new_h]> - see L</rescale> method for more info.
Default: do not rescale.

=item * rescale_pct

Optional floating point value with rescale ratio in percent - see L</rescale_pct> method for more info.
Default: do not rescale.

=item * convert_image_type

String identifying image type (e.g. C<'BITMAP'> - for valid values see <L/"Supported image types">). 
Default: no conversion.

=back

=head1 METHODS

=head2 new_from_file

Create PDL::IO::Image object from image file.

 my $pimage = IO::PDL::Image->new_from_file($filename);
 #or
 my $pimage = IO::PDL::Image->new_from_file($filename, $format);
 #or
 my $pimage = IO::PDL::Image->new_from_file($filename, $format, $format_flag);
 #or
 my $pimage = IO::PDL::Image->new_from_file($filename, $format, $format_flag, $page);

C<$filename> - input image file name.

C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">),
default is C<'AUTO'> which means that format is auto detected (based on file header with fallback to detection based
on file extension).

C<$format_flag> - optional flag related to loading given file format, default if C<0> (no extra flags). The flag can be
created by OR-ing some of available constants:

 PDL::IO::Image::GIF_LOAD256        Load the image as a 256 color image with unused
                                    palette entries, if it's 16 or 2 color
 PDL::IO::Image::GIF_PLAYBACK       'Play' the GIF to generate each frame (as 32bpp)
                                    instead of returning raw frame data when loading
 PDL::IO::Image::ICO_MAKEALPHA      Convert to 32-bit and create an alpha channel from
                                    the ANDmask when loading
 PDL::IO::Image::JPEG_FAST          Load the file as fast as possible, sacrificing some quality
 PDL::IO::Image::JPEG_ACCURATE      Load the file with the best quality, sacrificing some speed
 PDL::IO::Image::JPEG_CMYK          This flag will load CMYK bitmaps as 32-bit separated CMYK
 PDL::IO::Image::JPEG_GREYSCALE     Load and convert to a 8-bit greyscale image (faster than
                                    loading as 24-bit and converting to 8-bit)
 PDL::IO::Image::JPEG_EXIFROTATE    Load and rotate according to Exif 'Orientation' tag if available
 PDL::IO::Image::PCD_BASE           This flag will load the one sized 768 x 512
 PDL::IO::Image::PCD_BASEDIV4       This flag will load the bitmap sized 384 x 256
 PDL::IO::Image::PCD_BASEDIV16      This flag will load the bitmap sized 192 x 128
 PDL::IO::Image::PNG_IGNOREGAMMA    Avoid gamma correction on loading
 PDL::IO::Image::PSD_CMYK           Reads tags for separated CMYK (default is conversion to RGB)
 PDL::IO::Image::PSD_LAB            Reads tags for CIELab (default is conversion to RGB)
 PDL::IO::Image::RAW_PREVIEW        Try to load the embedded JPEG preview with included Exif 
                                    data or default to RGB 24-bit
 PDL::IO::Image::RAW_DISPLAY        Load the file as RGB 24-bit
 PDL::IO::Image::RAW_HALFSIZE       Output a half-size color image
 PDL::IO::Image::TARGA_LOAD_RGB888  If set the loader converts RGB555 and ARGB8888 -> RGB888
 PDL::IO::Image::TIFF_CMYK          Load CMYK bitmaps as separated CMYK (default is conversion to RGB)

=head2 new_from_pdl

Create PDL::IO::Image object from PDL piddle with pixel (+ optional palette) data.

 my $pimage = IO::PDL::Image->new_from_pdl($pixels_pdl);
 #or
 my $pimage = IO::PDL::Image->new_from_pdl($pixels_pdl, $palette_pdl);

=head2 pixels_to_pdl

Export pixel data from PDL::IO::Image object into a piddle.

 my $pixels_pdl = $pimage->pixels_to_pdl;
 #or
 my $pixels_pdl = $pimage->pixels_to_pdl($x1, $x2, $y1, $y2);

=head2 palette_to_pdl

Export palette (aka LUT - color lookup table) data from PDL::IO::Image object into a piddle.

 my $palette_pdl = $pimage->palette_to_pdl;

=head2 save

Export PDL::IO::Image object into a image file.

 $pimage->save($filename, $format, $flags);
 #or
 $pimage->save($filename, $format);
 #or
 $pimage->save($filename);
 
C<$filename> - output image file name.

C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">),
default is C<'AUTO'> which means that format is auto detected from extension of C<$filename>.

C<$format_flag> - optional flag related to saving given file format, default if C<0> (no extra flags). The flag can be
created by OR-ing some of available constants:

 PDL::IO::Image::BMP_SAVE_RLE              Compress the bitmap using RLE when saving
 PDL::IO::Image::EXR_FLOAT                 Save data as float instead of as half (not recommended)
 PDL::IO::Image::EXR_NONE                  Save with no compression
 PDL::IO::Image::EXR_ZIP                   Save with zlib compression, in blocks of 16 scan lines
 PDL::IO::Image::EXR_PIZ                   Save with piz-based wavelet compression
 PDL::IO::Image::EXR_PXR24                 Save with lossy 24-bit float compression
 PDL::IO::Image::EXR_B44                   Save with lossy 44% float compression
 PDL::IO::Image::EXR_LC                    Save with one luminance and two chroma channels, rather than RGB (lossy)
   for J2K format: integer X in [1..512]   Save with a X:1 rate (default = 16)
   for JP2 format: integer X in [1..512]   Save with a X:1 rate (default = 16)
 PDL::IO::Image::JPEG_QUALITYSUPERB        Saves with superb quality (100:1)
 PDL::IO::Image::JPEG_QUALITYGOOD          Saves with good quality (75:1 - default)
 PDL::IO::Image::JPEG_QUALITYNORMAL        Saves with normal quality (50:1)
 PDL::IO::Image::JPEG_QUALITYAVERAGE       Saves with average quality (25:1)
 PDL::IO::Image::JPEG_QUALITYBAD           Saves with bad quality (10:1)
   for JPEG format: integer X in [0..100]  Save with quality X:1
 PDL::IO::Image::JPEG_PROGRESSIVE          Saves as a progressive JPEG file
 PDL::IO::Image::JPEG_SUBSAMPLING_411      Save with high 4x1 chroma subsampling (4:1:1)
 PDL::IO::Image::JPEG_SUBSAMPLING_420      Save with medium 2x2 chroma subsampling (4:2:0) - default value
 PDL::IO::Image::JPEG_SUBSAMPLING_422      Save with low 2x1 chroma subsampling (4:2:2)
 PDL::IO::Image::JPEG_SUBSAMPLING_444      Save with no chroma subsampling (4:4:4)
 PDL::IO::Image::JPEG_OPTIMIZE             On saving, compute optimal Huffman coding tables
 PDL::IO::Image::JPEG_BASELINE             Save basic JPEG, without metadata or any markers
   for JXR format: integer X in [1..100)   Save with quality X:1 (default = 80), using X=100 means lossless
 PDL::IO::Image::JXR_LOSSLESS              Save lossless (quality = 100)
 PDL::IO::Image::JXR_PROGRESSIVE           Saves as a progressive JPEG-XR file
 PDL::IO::Image::PNG_Z_BEST_SPEED          Save using ZLib level 1 compression (default value is 6)
 PDL::IO::Image::PNG_Z_DEFAULT_COMPRESSION Save using ZLib level 6 compression (default)
 PDL::IO::Image::PNG_Z_BEST_COMPRESSION    Save using ZLib level 9 compression (default value is 6)
 PDL::IO::Image::PNG_Z_NO_COMPRESSION      Save without ZLib compression
 PDL::IO::Image::PNG_INTERLACED            Save using Adam7 interlacing
 PDL::IO::Image::PNM_SAVE_RAW              Saves the bitmap as a binary file
 PDL::IO::Image::PNM_SAVE_ASCII            Saves the bitmap as an ASCII file
 PDL::IO::Image::TIFF_CMYK                 Stores tags for separated CMYK
 PDL::IO::Image::TIFF_PACKBITS             Save using PACKBITS compression
 PDL::IO::Image::TIFF_DEFLATE              Save using DEFLATE compression (also known as ZLIB compression)
 PDL::IO::Image::TIFF_ADOBE_DEFLATE        Save using ADOBE DEFLATE compression
 PDL::IO::Image::TIFF_NONE                 Save without any compression
 PDL::IO::Image::TIFF_CCITTFAX3            Save using CCITT Group 3 fax encoding
 PDL::IO::Image::TIFF_CCITTFAX4            Save using CCITT Group 4 fax encoding
 PDL::IO::Image::TIFF_LZW                  Save using LZW compression
 PDL::IO::Image::TIFF_JPEG                 Save using JPEG compression (8-bit greyscale and 24-bit only)
 PDL::IO::Image::TIFF_LOGLUV               Save using LogLuv compression (only available with RGBF images
 PDL::IO::Image::TARGA_SAVE_RLE            Save with RLE compression

=head2 get_image_type

 my $imtype = $pimage->get_image_type;

=head2 get_colors_used

 my $colors = $pimage->get_colors_used;

=head2 get_bpp

 my $bpp = $pimage->get_bpp;

=head2 get_width

 my $w = $pimage->get_width;

=head2 get_height

 my $h = $pimage->get_height;

=head2 get_dots_per_meter_x

 my $dpmx = $pimage->get_dots_per_meter_x;

=head2 set_dots_per_meter_x

 $pimage->set_dots_per_meter_x($res);

=head2 get_dots_per_meter_y

 my $dpmy = $pimage->get_dots_per_meter_y;

=head2 set_dots_per_meter_y

 $pimage->set_dots_per_meter_y($res);

=head2 get_color_type

 my $coltype = $pimage->get_color_type;

=head2 is_transparent

 my $bool = $pimage->is_transparent;

=head2 get_transparent_index

 my $idx = $pimage->get_transparent_index;

=head2 set_transparent_index

 $pimage->set_transparent_index($index);

=head2 flip_horizontal

 $pimage->flip_horizontal;

=head2 flip_vertical

 $pimage->flip_vertical;

=head2 rotate

 $pimage->rotate($angle);

=head2 rescale

 $pimage->rescale($dst_width, $dst_height, $filter);
 #or
 $pimage->rescale($dst_width, 0);
 #or
 $pimage->rescale(0, $dst_height);

=head2 rescale_pct

 $pimage->rescale($dst_width_pct, $dst_height_pct, $filter);
 #or
 $pimage->rescale($dst_width_pct, 0);
 #or
 $pimage->rescale(0, $dst_height_pct);

=head2 convert_image_type

 $pimage->convert_image_type($image_type, $scale_linear);
 #or
 $pimage->convert_image_type($image_type);

C<$image_type> - string identifying image type (e.g. C<'BITMAP'> - for valid values see <L/"Supported image types">).

=head2 adjust_colors

 $pimage->adjust_colors($brightness, $contrast, $gamma, $invert);

=head2 tone_mapping

 $pimage->tone_mapping($tone_mapping_operator, $param1, $param2);
 # $tone_mapping_operator
 #    0 = Adaptive logarithmic mapping (F. Drago, 2003)
 #    1 = Dynamic range reduction inspired by photoreceptor physiology (E. Reinhard, 2005)
 #    2 = Gradient domain high dynamic range compression (R. Fattal, 2002)

=head2 free_image_version

 my $v = PDL::IO::Image->free_image_version();

=head2 format_list

 my @f = PDL::IO::Image->format_list();

=head2 format_extension_list

 my $ext = PDL::IO::Image->format_extension_list($format);
 
C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">).

=head2 format_mime_type

 my $mtype = PDL::IO::Image->format_mime_type($format);

C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">).

=head2 format_description

 my $desc = PDL::IO::Image->format_description($format);

C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">).

=head2 format_can_read

 my $bool = PDL::IO::Image->format_can_read($format);

C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">).

=head2 format_can_write

 my $bool = PDL::IO::Image->format_can_write($format);

C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">).

=head2 format_can_export_type

 my $bool = PDL::IO::Image->format_can_export_type($format, $image_type);

C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">).

C<$image_type> - string identifying image type (e.g. C<'BITMAP'> - for valid values see <L/"Supported image types">).

=head2 format_can_export_bpp

 my $bool = PDL::IO::Image->format_can_export_bpp($format, $bpp);

C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">).

C<$bpp> - bits per pixel (e.g. 1, 4, 8, 16, 24, 32)

=head2 format_from_mime

 my $format = PDL::IO::Image->format_from_mime($mime_type);

=head2 format_from_file

 my $format = PDL::IO::Image->format_from_file($filename);

C<$format> - string identifying file format (e.g. C<'JPEG'> - for valid values see <L/"Supported file formats">).

=cut


;



# Exit with OK status

1;

		   