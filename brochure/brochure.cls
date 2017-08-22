%2 columns, 2 pages
% header across the top of the page w/ some sort of under line
% logo at the top and bottom right of the page, product name bottom left corner
% info box is rounded at the corner and is just a shaded version of the same background of the document
%images horizontally fill the column and the caption has no label but is in a box the same as an info box under the image
% a line that is centered in the page and take up 1/4-3/4 of the page to seperate columns
\ProvidesClass{brochure}
\NeedsTeXFormat{LaTeX2e}
%\LoadClass{article}
\LoadClass{memoir}
\usepackage{tcolorbox}
\usepackage{multicol}
\usepackage{capt-of}
\usepackage{array}
\usepackage[letterpaper,left=.4in,right=.4in,top=.6in,bottom=1in]{geometry}

\usepackage{xcolor}%
\definecolor{webblue}{rgb}{0, 1, 1}  % less intense blue
\definecolor{webred}{rgb}{2, 0.4, 0}   % less intense red
\definecolor{eoibg}{RGB}{250,250,230}
\definecolor{eoibgDark}{RGB}{235,235,216}
\definecolor{eoilogo}{RGB}{23,121,107}
\definecolor{white}{RGB}{255,255,255}
\definecolor{darkblue}{RGB}{0,0,150}

\newcommand\infoBoxColour{eoibgDark}
\newcommand\infoBoxTitleColour{lightgray}
\newcommand\titleboxcolour{red}
\newcommand\colSepLineColour{lightgray}
\newcommand\titleBoxColour{eoilogo}
\newcommand\titleBoxTextColour{eoibg}
\newcommand\contactInfoTitleColour{lightgray}
\newcommand\contactInfoBoxColour{eoibgDark}
\newcommand\contactInfoBoxTextColour{black}
\newcommand\lineColor{\titleBoxColour}

\newcommand\docType{Document Type (define docType)}
\newcommand\productName{Product (productName)}
\newcommand\email{dummy@eatabattery.com}
\newcommand\phone{(111) 222-3333}
\newcommand\website{eatabattery.com}
\newcommand\company{Eat A Battery LTD.}

\newcommand\addressA{123 Duracell Ave, 9V}
\newcommand\addressB{Scranton, PA 12345}
\newcommand\logo{logo}

\newcommand\templateLineLengthPt{\textwidth}
\usepackage{chngcntr}
%\counterwithout*{figure}{figure}
\counterwithout{figure}{figure}

\def\degs{\ensuremath{^\circ}}
\newcommand{\FIXME}[1]{\typeout{**FIXME** #1}\textbf{[FIXME: #1]}}
\newcommand{\NOTE}[1]{\textbf{Note:} #1}

	\newcommand\grayLine[1]{\begin{center} \textcolor{lightgray}{\rule{#1}{1pt}} \end{center}}


\usepackage[linkbordercolor = webblue]{hyperref}

\hypersetup{
	%bookmarks=true,		 % show bookmarks bar?
	unicode=false,	    % non-Latin characters in Acrobat’s bookmarks
	pdftoolbar=true,		% show Acrobat’s toolbar?
	pdfmenubar=true,		% show Acrobat’s menu?
	pdffitwindow=false,      % window fit to page when opened
	pdfstartview={FitH},    % fits the width of the page to the window
	pdftitle={\docType},    % title
	pdfauthor={\company},    % author
	pdfsubject={\productName~\docType},   % subject of the document
	pdfkeywords={}, % list of keywords
		pdfnewwindow=true,	% links in new PDF window
	colorlinks=true,	   % false: boxed links; true: colored links
	linkbordercolor=webblue,
	citebordercolor=green,
	filebordercolor=blue,
	urlbordercolor=magenta,
	linkcolor=darkblue,	       % color of internal links (change box color with linkbordercolor)
	citecolor=darkblue,      % color of links to bibliography
	filecolor=darkblue,   % color of file links
	urlcolor=darkblue,	      % color of external links
	linktoc=page,
}


%\pagestyle{empty}
% ****************************************
\makepagestyle{pageWithLinesUnNumbered}
\makeevenfoot{pageWithLinesUnNumbered}{\vspace{-11pt}\includegraphics[width=.22\paperwidth]{\logo}}{}{\large{\productName}}
\makeoddfoot{pageWithLinesUnNumbered}{\large{\productName}}{}{\vspace{-11pt}\includegraphics[width=.22\paperwidth]{\logo}}
\makeevenhead{pageWithLinesUnNumbered}{}{}{}
\makeoddhead{pageWithLinesUnNumbered}{}{}{}

\makeheadfootruleprefix{pageWithLinesUnNumbered}{\centering\color{\lineColor}}{\color{\lineColor}}
\makefootrule{pageWithLinesUnNumbered}{\templateLineLengthPt}{3pt}{\footruleskip}

\pagestyle{pageWithLinesUnNumbered}
\linespread{1.5}
%-------------------------------------------
% info box
\newenvironment{infoBox}[1]{
	\begin{tcolorbox}[width=\linewidth,colback={\infoBoxColour},title=\large{#1}, colbacktitle=\infoBoxTitleColour,boxrule=0pt,toprule=0pt,coltitle = black, outer arc=0mm, arc = 0mm]
	}
{\end{tcolorbox}}

\newenvironment{modelCompare}{\begin{tabular*}{\linewidth}{@{\extracolsep{\fill}}lcc}
	 & \textbf{Model A} & \textbf{Model B}\\ \hline
}
{\end{tabular*}}

%-------------------------------------------
% title box
\newcommand{\maketitleBox}{

\huge{\productName}\normalsize\hfill\includegraphics[width=3in]{\logo}

\begin{tcolorbox}[width=\textwidth,colback={\titleBoxColour}, coltext = \titleBoxTextColour,boxrule=0pt,toprule=0pt, arc = 0mm, outer arc=0mm]
\hfill\LARGE\docType
\end{tcolorbox}
}

%-------------------------------------------
% contact info
\newcommand{\makeContactInfo}{

\begin{tcolorbox}[width=\linewidth,colback=\contactInfoBoxColour, coltext = \contactInfoBoxTextColour,boxrule=1pt,toprule=1pt, coltitle = black, colbacktitle = \contactInfoTitleColour, outer arc=2mm, arc = 1.8mm, title=\large{Company Information}]
\begin{center}
	\company

	\vspace{11pt}

	\begin{tabular}{l l}
	\website & \addressA\\
	\email & \addressB\\
	\end{tabular}
\end{center}
\end{tcolorbox}
}


%-------------------------------------------
% brochure box
% title strip, company name, logo, product name, contact info,
\newenvironment{brochure}{
	\maketitleBox
	\newenvironment{page}{
		\begin{multicols}{2}
		\setlength{\columnseprule}{0.3pt}
		\renewcommand{\columnseprulecolor}{\color{\colSepLineColour}}
		}
		{\end{multicols}\newpage}

	\newenvironment{lastpage}{
		\begin{multicols}{2}
		\setlength{\columnseprule}{0.3pt}
		\renewcommand{\columnseprulecolor}{\color{\colSepLineColour}}
		}
		{\makeContactInfo\end{multicols}}
}{}


\newcommand{\addfig}[3]{
	\begingroup
		\centering
		\includegraphics[width=\linewidth]{#1}
		\captionof{figure}{#2}\label{fig:#3}
	\endgroup
}

%-------------------------------------------
%section title
\newcommand{\sectionTitle}[1]{
\begin{center}{\LARGE{#1}}\\
\noindent\rule{.5\linewidth}{1pt}
\end{center}
}
