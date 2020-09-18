---
title: "Tech stack of weileizeng.com"
categories:
- Study
published: true
#feature_text: |
#  This is my post
excerpt: |
  I update this website only several times a year, and sometimes I forget how to do it. So here is the tools to build the website from the scratch.
---

I started hosting this website in late 2019.

The domain is managed on [Netlify](https://www.netlify.com/). Netlify can host static website directly from github repoes. Or one can use [GitHub Pages](https://pages.github.com/) to host website and then redirect to the domain. Both are easy and I have several examples on GitHub, including this webpage.

Other than those platforms, one still need to build a static html website. It is uncommon to write HTML directly, because there are various tools to generate static webpages from simple text format such as MarkDown. The one I am using is [jekyll](https://jekyllrb.com/). I am using it because it is supported by [GitHub Themes](), which allow us to generate a website by clicking on a button. That's very convenient for sharing small projects. But in general, one can use any tool to generate the static website into a folder and ask GitHub to host it as it is.

Along the way, I find many tools useful, for example, jekyll-scholar, math-jax, markmap, Makefile.
