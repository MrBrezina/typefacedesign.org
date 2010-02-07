all: init site/data.xml site/style.xsl
	xsltproc -o site/dummy.xml site/style.xsl site/data.xml
init:
	mkdir -p output
clean:
	rm -rf output
