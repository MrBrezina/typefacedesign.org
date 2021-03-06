Here are few notes on how to modify and update the MATD website.

### Requirements:

- Terminal
- git (optionally a client: [GitHub for Mac](https://github.com/blog/878-announcing-github-for-mac) or [GitX](http://gitx.laullon.com/) are good)
- xsltproc (should be preinstalled on Macs with with XCode)

### Updating the HTML files:

- clone the git repository
- edit source files
- in Terminal change to folder with this file
- type and confirm: `./build` *
- commit changes and push back to GitHub repository

*) This is a simple script which updates the HTML (only) in the years' folders. Everything else is to be edited manually. See Editing (below) for more details. Make sure it has necessary rights (run: $chmod +x build).

### Editing HTML:

- the source stuff is saved in `site/` folder. Each year has its own HTML and images in a separate folder.
- never edit HTML directly, edit `site/data.xml` instead. Custom modifications of HTML would get overwritten next time you run `./build`.
- `site/data.xml` is transformed to HTML by the `./build` script (by means of XSLT)
- `site/data.xml` contains all textual information, also filenames of specimens, group specimen, thank-you texts, etc. It should be self-descriptive. Each year has a flag `ready` which needs to be set to `1` for the year to be exported.
- if you want to alter the HTML structure of all years, edit `style.xsl` (you need to understand XSLT to do that properly).
- Google Analytics code is generated automatically

### Editing CSS:

- `site/style.css` is common CSS file for all years.
- preferably, change only colours (to fit with the year's colour scheme) in the appropriate year section. This way the design is kept consistent for all years.

### Editing pictures:

- `img/` in root folder includes pictures common to all pages.
- `YEAR/img/` includes year-specific pictures for the year colour scheme. To be edited manually or via Photoshop templates in the `design/` folder.
- the previews are mastered and copied manually from `resources/` to appropriate folder in `site/` (see the `design/preview_template.pdf` and guidelines I emailed to students earlier), note that there is a need to add coloured background and save as web-optimized PNGs (e.g. in Photoshop) and to make them look aligned and equal.

### Updating PDFs:

- the specimens, RoPs and such are to be uploaded manually to `resources/…` folder directly on the FTP server to the appropriate year folder. We do not keep them here for several reasons.
- name them precisely as they are in the `data.xml` file.

### Editing RSS:

- you need to edit `feed.xml` manually at the moment.

### How to set default year for the address www.typefacedesign.org:

- modify the `site/index.php` to redirect at a particular year folder

### Adding new year:

- add it to `data.xml` and set all textual data
- add year folder (ideally copy from previous) and `img/` and `previews/` subfolders.
- add properly coloured year-dependent images
- edit main CSS file = copy previous year section and modify it with new year's data (e.g. change 2009 -> 2010) everywhere in that section)
- add previews (people usually sent PDFs and I converted them via Photoshop to optimized PNGs)
- upload all PDFs
- when everything is ready, set the ready flag to 1 and run the build script
- double check (also the previous years before uploading)
- modify the `site/index.php` to make it the default year
- upload the files via FTP
- remember to push to the GitHub repository
