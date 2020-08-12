


english: init
	cp lang_en resume/lang.tex ; \
	for f in *.tex; do xelatex $$f; done

french: init
	cp lang_en resume/lang.tex ; \
    for f in *.tex; do xelatex $$f; done


init:
	[ ! -f "resume/info.tex" ] && cp -n info resume/info.tex ; echo "Copied info.tex"

clean:
	 rm resume/info.tex resume/lang.tex *.aux *.log *.out
