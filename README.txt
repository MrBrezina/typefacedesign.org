Here are few notes on how to modify and update the MATD website.

Storage:
- everything is saved on FTP now in folder "_sources/"

Requirements:
Terminal
xsltproc – should be preinstalled

Updating the HTML files:
1. copy "_sources/" to local
2. edit
3. in Terminal change to the "_sources/" folder and run:

$./build

This is a simple script which updates the HTML (only) in the years' folders. Everything else is to be edited manually. See Editing (below) for more details. Make sure it has necessary rights (run: $chmod +x build).
4. copy stuff back so both XMLs and HTMLs are updated (and backed up) on the FTP
5. copy contents of the "site/" folder straight to the web root on the FTP server

Editing HTML:
- the source stuff is saved in «site/» folder. Each year has its own HTML and images in separate folder.
- never edit HTML directly, edit "site/data.xml" instead. Custom modifications of HTML would get overwritten next time you run "./build".
- "site/data.xml" is transformed to HTML using the build script (by means of XSLT)
- "site/data.xml" contains all textual information, also filenames of specimens, group specimen, thank-you texts, etc. It is pretty self-descriptive. Each year has a flag "ready" which needs to be set to "1" for the year to be exported.
- if you want to alter the HTML structure of all years, edit style.xsl (warning: very geeky, you need to understand XSLT).
- Google Analytics code is generated automatically

Editing CSS:
- "site/style.css" is common CSS file for all years.
- preferably, change only colours (to fit with the year's colour scheme) in the appropriate year section. This way the design is kept consistent for all years.

Editing pictures:
- "img/" in root folder includes pictures common to all pages.
- "YEAR/img/" includes year-specific pictures (to fit with the year colour scheme). To be edited manually or via Photoshop templates in the "design/" folder.
- the previews are mastered and copied manually from «resources/» to appropriate folder in «site/» (also note the "design/preview_template.pdf" and guidelines I emailed to students earlier), note there is need to add coloured background and save as optimized PNGs (e.g. in Photoshop) and to make them look aligned and equal. Not so easy.

Updating PDFs:
- the specimens, RoPs and such are to be uploaded manually to «resources/…» folder on the FTP server to the appropriate year folder.
- name them precisely as they are in the data.xml file.

Editing RSS:
- edit feed.xml manually.

Set default year for the address www.typefacedesign.org:
- modify the "site/index.php" to aim at particular year folder

Adding a year:
- add a node in data.xml and set all textual data
- add year folder (ideally copy from previous) and "img/" and "previews" subfolders.
- add properly coloured year-dependent images
- edit main CSS file = copy previous year section and modify it with new year's data (change 2009 -> 2010) everywhere in that section)
- add previews (people usually sent PDFs and I converted them via Photoshop to optimized PNGs)
- upload all PDFs
- when everything is ready, set the ready flag to 1 and run the build script
- double check (also the previous years before uploading)
- modify the "site/index.php"" to make it the default year