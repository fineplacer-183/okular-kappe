project_files = $(wildcard *.scad)

all: model.png model.stl

%.png: $(project_files)
	openscad -m make model.scad --imgsize=1280,1024 --preview -o $@
	convert $@ -trim $@

model.stl: $(project_files)
	openscad -o model.stl model.scad

clean:
	rm -fr model.png model.stl

