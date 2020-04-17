echo this script will do all the procedures after updating the bib file zwl.bib

filename=zwl
echo "input file (to be copied): ../_bibliography/$filename.bib"
cp ../_bibliography/$filename.bib .

# export TMPDIR=.

bibtex2html $filename.bib

echo The conversion from bibtex to html is finished. Now lets do some post processing to embed it into an html page



#echo remove the bibtex link. It doesn not work due to the wrong relative path

#delete last two lines to add a link in the last 3rd line
for f in  $filename.html ${filename}_bib.html 
do
    sed -i '' '$d' $f
    sed -i '' '$d' $f
echo "<p>Go back to <a href=\"index.html\">Publications</a></p>
</body>
</html>" >> $f
done

# remove temp file
rm $filename.bib



# body is not in use anymore, replaced by jekyll- scholar
# cp $filename.html ${filename}_body.html
#sed "" "/bib.html/d" $filename.bib > ${filename}_body.html 
# sed -i '' '1,16d' ${filename}_body.html
# sed -i '' '$d' ${filename}_body.html
# sed -i '' '$d' ${filename}_body.html  


# cp ${filename}_body.html ../../_includes/
# cp ${filename}.html ${filename}_bib.html ..
# echo finish copy files


#echo create new file without first line: short_$filename.html  Because the first line is not recognized /in the markdown page
#sed '1d' $filename.html > short_$filename.html
#sed '/pattern to match/d' ./infile
#echo remove the bibtex link. It doesn not work due to the wrong relative path
#sed -i "" "/bib.html/d" short_$filename.html

#echo generate successfully. Now you can put short_$filename.html in your page.
#echo example: one line html /in markdown:
#echo "<div> {% include bibtex2html/short_zwl.html %}</div>"


#ls ../../_site/2019/12/24/publications/
#echo copy necessary files into folder /_site/2019/12/24/publications/

#cp *.html ../../_site/2019/12/24/publications/
#ls ../../_site/2019/12/24/publications/
