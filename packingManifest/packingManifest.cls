\ProvidesClass{packingManifest}
\NeedsTeXFormat{LaTeX2e}
%\LoadClass{article}
\LoadClass[landscape]{memoir}
\usepackage{tcolorbox}
\usepackage{lastpage}
\usepackage[mmddyyyy]{datetime}
\usepackage[letterpaper,landscape,left=.5in,right=.5in,top=.5in,bottom=1in]{geometry}

%--------------------------------------------------------
% Our Information
\newcommand\email{dummy@eatabattery.com}
\newcommand\phone{(111) 222-3333}
\newcommand\website{eatabattery.com}
\newcommand\company{Eat A Battery LTD.}

\newcommand\addressA{123 Duracell Ave}
\newcommand\addressB{9V}
\newcommand\addressC{Scranton, PA 12345}
\newcommand\logo{logo.eps}
\newcommand\contactC{\phone}
\newcommand\contactA{\website}
\newcommand\contactB{\email}

%------------------------------------------------------
% Customer Info
\newcommand\shippingName{\billingName}
\newcommand\shippingCompany{\billingCompany}
\newcommand\shippingAddressA{\billingAddressA}
\newcommand\shippingAddressB{\billingAddressB}
\newcommand\shippingAddressC{\billingAddressC}

\usepackage{xcolor}%
\definecolor{webblue}{rgb}{0, 1, 1}  % less intense blue
\definecolor{webred}{rgb}{2, 0.4, 0}   % less intense red
\definecolor{eoibg}{RGB}{250,250,230}
\definecolor{eoibgDark}{RGB}{235,235,216}
\definecolor{eoilogo}{RGB}{23,121,107}
\definecolor{white}{RGB}{255,255,255}
\definecolor{darkblue}{RGB}{0,0,150}

\newcommand\lineColor{eoilogo}

\newcommand\templateLineLengthPt{\textwidth}

%\pagestyle{empty}
% ****************************************
\makepagestyle{pageWithLine}
\makeevenfoot{pageWithLine}{\vspace{-11pt}\includegraphics[width=.1\paperwidth]{\logo}}{}{Page \thepage/\pageref{LastPage}}
\makeoddfoot{pageWithLine}{\textbf{Page \thepage/\pageref{LastPage}}}{}{\vspace{-11pt}\includegraphics[width=.1\paperwidth]{\logo}}
\makeevenhead{pageWithLine}{}{}{}
\makeoddhead{pageWithLine}{}{}{}

\makeheadfootruleprefix{pageWithLine}{\centering\color{\lineColor}}{\color{\lineColor}}
\makefootrule{pageWithLine}{\templateLineLengthPt}{2pt}{\footruleskip}

\pagestyle{pageWithLine}
\linespread{1}
%-------------------------------------------
% make top
\newcommand{\makeTop}{
	\begin{minipage}{.15\textwidth}
	\includegraphics[width=.8\textwidth]{\logo}
	\end{minipage}
	\begin{minipage}{.25\textwidth}
	\centering
	\textbf{\addressA\\
	\addressB\\
	\addressC}
	\end{minipage}
	\begin{minipage}{.25\textwidth}
	\centering
	\textbf{\contactA\\
	\contactB\\
	\contactC}
	\end{minipage}
	\begin{minipage}{.25\textwidth}
	\begin{tabular}{|l |l|}
	\hline
	\textbf{Order: }\orderNumber & \textbf{Ship Method: }\shipMethod\\
	\hline
	\end{tabular}
	\end{minipage}
	\newline
}
%-------------------------------------------
% customerInfo
\newcommand{\customerInfo}{
	\newenvironment{infoBox}{\begin{minipage}{.3\textwidth}
		\begin{tcolorbox}[height = 90pt, width=\textwidth,colback={white}, colbacktitle=white,boxrule=1pt,toprule=1pt,coltitle = black, outer arc=0mm, arc = 0mm]
		}
	{\end{tcolorbox}\end{minipage}}

	\begin{infoBox}
		\textbf{Sold To:}

		\vspace{5pt}\hrule\@width .4\linewidth \vspace{5pt}
		\billingName\\
		\billingCompany\\
		\billingAddressA\\
		\billingAddressB\\
		\billingAddressC
	\end{infoBox}
	\begin{minipage}{.04\textwidth}
	~
	\end{minipage}
	\begin{infoBox}
		\textbf{Ship To:}

		\vspace{5pt}\hrule\@width .4\linewidth \vspace{5pt}
		\shippingName\\
		\shippingCompany\\
		\shippingAddressA\\
		\shippingAddressB\\
		\shippingAddressC
	\end{infoBox}
	\begin{minipage}{.04\textwidth}
	~
	\end{minipage}
	\begin{infoBox}
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}l l}
		\textbf{Order Number: }&\orderNumber\\
		\textbf{Invoice: }&\invoiceNumber\\
		\textbf{Order Date: }&\orderDate\\
		\textbf{Document Date: }&\documentDate\\
		\textbf{Items: }&\items\\
		\end{tabular*}
	\end{infoBox}
}

%-------------------------------------------
% orderItem
\newenvironment{orderItem}{
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}|p{.08\textwidth}|p{.08\textwidth}|p{.08\textwidth}|l|p{.08\textwidth}|p{.08\textwidth}|}
	\hline
	\textbf{Ordered}& \textbf{Line Item}&\textbf{Location}&  \textbf{Item}& \textbf{Shipped}& \textbf{Backordered}\\\hline
	}
{\end{tabular*}}

%-------------------------------------------
% packagingList
\newcommand{\makePackagingList}{
	\centering
	\makeTop

	\vspace{11pt}
	\customerInfo
	}
