\ProvidesClass{labelFourBySix}
\NeedsTeXFormat{LaTeX2e}
\LoadClass[10pt]{memoir}
\usepackage{tcolorbox}
\usepackage{lscape}
\usepackage{multicol}
\usepackage{graphicx}
\usepackage{colortbl}

\usepackage[T1]{fontenc}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif


\paperwidth=4in
\paperheight=6in
\special{papersize=\paperheight,\paperwidth}

\usepackage[left=1mm,top=1mm,right=1mm,bottom=1mm]{geometry} % Document margins

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

\newcommand\contactA{\website}
\newcommand\contactB{\email}

\newcommand\titleDescrip{}

\newcommand\templateLineLengthPt{\textwidth}
\usepackage{chngcntr}

\def\degs{\ensuremath{^\circ}}

\pagestyle{empty}
\linespread{1.2}

%-------------------------------------------
\newcommand{\grayLine}[1]{
	\begin{center}
		\tiny{\textcolor{lightgray}{\rule{#1}{1pt}}}
	\end{center}
}

%-------------------------------------------
% info box

\newenvironment{infoBox}[1]{\small
	\begin{tcolorbox}[width=\linewidth,colback=eoibg, colbacktitle=eoibg, boxrule=1pt,toprule=1pt,coltitle = black, outer arc=2mm, arc = 1.8mm, left = 0mm, right = 0mm, top = 0mm,bottom = 0mm]
	\textbf{#1}\\
	}
{\end{tcolorbox}}

\newenvironment{modelCompare}{\begin{tabular*}{\linewidth}{@{\extracolsep{\fill}}lcc}
	 & \textbf{Model A} & \textbf{Model B}\\ \hline
}
{\end{tabular*}}

%-------------------------------------------
% title box
\newcommand{\maketitleBox}{
	\linespread{.9}
	\centering
	\Large{
	\textbf{\company}}\\
	\large{\textbf{\productName}}\\
	\large{\titleDescrip}\vspace{-10pt}
	\textcolor{lightgray}{\rule{.85\linewidth}{1pt}}
}

%-------------------------------------------
% contact info
\newcommand{\makeContactInfo}{
\begin{infoBox}{\textcolor{eoilogo}{~~~~~~~~~~~{\company}}\\}
	%\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
	\centering
	\begin{tabular}{ll}
		\small \website &\small{\addressA}\\
		\small \email &\small{\addressB}\\
	\end{tabular}
\end{infoBox}
}


%-------------------------------------------
% backLabel
% title strip, company name, logo, product name, contact info,
\newenvironment{backLabel}{
	\begin{landscape}
	\maketitleBox
	\vspace{-10pt}
	\newenvironment{page}{
		\linespread{1.1}
		\begin{multicols}{2}
		\setlength{\columnseprule}{0.1pt}
		\renewcommand{\columnseprulecolor}{\color{\colSepLineColour}}
		}
		{\end{multicols}}
}{\end{landscape}}

\newcommand{\addfig}[3]{
	\begingroup
		\centering
		\includegraphics[width=\linewidth]{#1}
		\captionof{figure}{#2}\label{fig:#3}
	\endgroup
}

