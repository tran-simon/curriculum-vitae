


english: init
	cp lang_en resume/lang.tex ; \
	for f in *.tex; do xelatex $$f; done

french: init
	cp lang_en resume/lang.tex ; \
    for f in *.tex; do xelatex $$f; done


init:
	cp -n info resume/info.tex

clean:
	 rm resume/info.tex resume/lang.tex
