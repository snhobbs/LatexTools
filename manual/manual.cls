\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manual}
\usepackage{color}

\usepackage{xcolor}%
\definecolor{webblue}{rgb}{0, 1, 1}  % less intense blue
\definecolor{webred}{rgb}{2, 0.4, 0}   % less intense red
\definecolor{eoibg}{RGB}{250,250,230}
\definecolor{eoilogo}{RGB}{23,121,107}
\definecolor{white}{RGB}{255,255,255}
\definecolor{darkblue}{RGB}{0,0,150}

\usepackage[linkbordercolor = webblue]{hyperref}
%\usepackage{lscape}
\usepackage{pdflscape}

\newcommand{\currChapter}{}
\def\ra{$\rightarrow$}

\usepackage{hypcap}
\usepackage{biblatex}
\fontfamily{pcr}
\usepackage[nonumberlist, toc]{glossaries}
\usepackage{glossary-mcols}

%\usepackage{arydshln}
\usepackage{amsmath}
\usepackage{graphicx}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{bm}% bold math

%\usepackage{ulem} THIS BREAKS THINGS
\usepackage{longtable}
\usepackage{caption}
\usepackage{subcaption}
\usepackage{bytefield}

\usepackage{epstopdf}

\usepackage{booktabs}



%    ****************************************
%    *               OPTIONS                *
%    ****************************************
%
%



%\newcommand{\logo}[1]{\def \logoName {#1}}


% \FIXME{} is a useful macro for noting things needing to be changed.
% The following definition will also output a warning to the console
\newcommand{\FIXME}[1]{\typeout{**FIXME** #1}\textbf{[FIXME: #1]}}
\newcommand{\NOTE}[1]{\textbf{Note:} #1}
\newcommand{\hypNote}[2]{\href{#2}{#1}\footnote{\url{#2}}}

\newcommand{\strline}[3]{\centering{\textcolor{#1}{\linethickness{#2}
                        \line(1,0){#3}}}}
\newcommand{\memsection}[4]{%
  % define the height of the memsection
  \bytefieldsetup{bitheight=#3\baselineskip}%
  \bitbox[]{10}{%
    \texttt{#1}%      print end address
    \\
    %   do some spacing
    \vspace{#3\baselineskip}
    \vspace{-2\baselineskip}
    \vspace{-#3pt}
    \texttt{#2}%      print start address
  }%
  \bitbox{16}{#4}%    print box with caption
}

\newcommand{\colorbitbox}[3]{%
        \rlap{\bitbox{#2}{\color{#1}\rule{\width}{\height}}}%
        \bitbox{#2}{#3}
}

\newcommand{\memsectioncolor}[5]{%
  % define the height of the memsection
  \bytefieldsetup{bitheight=#3\baselineskip}%
  \bitbox[]{10}{%
    \texttt{#1}%      print end address
    \\
    %   do some spacing
    \vspace{#3\baselineskip}
    \vspace{-2\baselineskip}
    \vspace{-#3pt}
    \texttt{#2}%      print start address
  }%
  \colorbitbox{#4}{16}{#5}%    print box with caption
}


\newcommand\thes@sidedness{-1}
\DeclareOption{oneside}
  {\renewcommand\thes@sidedness{1}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{twoside}
  {\renewcommand\thes@sidedness{2}\PassOptionsToClass{\CurrentOption}{memoir}}

%  Changing the default point size from 10pt to 12pt uses a similar procedure,
%  but it's messier.

\newcommand\thes@ptsize{0}
\DeclareOption{9pt}
  {\renewcommand\thes@ptsize{9}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{10pt}
  {\renewcommand\thes@ptsize{10}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{11pt}
  {\renewcommand\thes@ptsize{11}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{12pt}
  {\renewcommand\thes@ptsize{12}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{14pt}
  {\renewcommand\thes@ptsize{14}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{17pt}
  {\renewcommand\thes@ptsize{17}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{20pt}
  {\renewcommand\thes@ptsize{20}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{25pt}
  {\renewcommand\thes@ptsize{25}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{30pt}
  {\renewcommand\thes@ptsize{30}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{36pt}
  {\renewcommand\thes@ptsize{36}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{48pt}
  {\renewcommand\thes@ptsize{48}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{60pt}
  {\renewcommand\thes@ptsize{60}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{*pt}
  {\renewcommand\thes@ptsize{99}\PassOptionsToClass{\CurrentOption}{memoir}}

% Other options are passed on to the memoir class.

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

% The \ProcessOptions command causes the execution of every option command
% FOO which is declared and for which the user typed the FOO option in his
% \documentclass.  For every undeclared option BAR there will be a warning
% message. (BBF 10/31/94)

\ProcessOptions\relax

% Take care of changed defaults

\ifnum\thes@sidedness<0
  \PassOptionsToClass{oneside}{memoir}
  \renewcommand\thes@sidedness{1}
\fi

\ifnum\thes@ptsize=0
  \PassOptionsToClass{12pt}{memoir}
  \renewcommand\thes@ptsize{12}
\fi

% Now load the memoir class, and configure it appropriately.

\LoadClass{memoir}

\setlrmarginsandblock{1in}{*}{*}
  \@tempdima=1in  \advance\@tempdima 25pt \advance\@tempdima\normalbaselineskip
  \@tempdimb=.75in  \advance\@tempdimb 30pt
\setulmarginsandblock{\@tempdima}{\@tempdimb}{*}

\AtBeginDocument{\checkandfixthelayout}

\pagestyle{simple}
\aliaspagestyle{book}{simple}
\aliaspagestyle{part}{simple}
\aliaspagestyle{chapter}{hangnum}
\aliaspagestyle{title}{simple}


% For some environments we switch back to single-spacing, also
% provides \dsp in case you need double-spacing where single-spacing
% is otherwise used.

\newcommand\ssp{\SingleSpacing}
\newcommand\dsp{\setSpacing{1.5}}

% Table of contents, lists of figures, and lists of tables should always
% be single-spaced.  If one wants them to be double-spaced instead (in a
% double-spaced document), the original macros are available as
% \memoirtableofcontents, \memoirlistoffigures, and \memoirlistoftables.

\let\memoirtableofcontents=\tableofcontents
\renewcommand\tableofcontents{\begin{SingleSpace}\memoirtableofcontents
  \end{SingleSpace}}

\let\memoirlistoffigures=\listoffigures
\renewcommand\listoffigures{\begin{SingleSpace}\memoirlistoffigures
  \end{SingleSpace}}

\let\memoirlistoftables=\listoftables
\renewcommand\listoftables{\begin{SingleSpace}\memoirlistoftables
  \end{SingleSpace}}

%Page Styles
% ****************************************
\makepagestyle{pageWithLines}
\makeevenfoot{pageWithLines}{\vspace{-11pt}\includegraphics[width=.22\paperwidth]{\logoName}}{\thepage}{\deviceName}
\makeoddfoot{pageWithLines}{\deviceName}{\thepage}{\vspace{-11pt}\includegraphics[width=.22\paperwidth]{\logoName}}
\makeevenhead{pageWithLines}{Section \thechapter : \currChapter}{}{}
\makeoddhead{pageWithLines}{Section \thechapter : \currChapter}{}{}

\makeheadfootruleprefix{pageWithLines}{\color{\lineColor}}{\color{\lineColor}}
\makeheadrule{pageWithLines}{\templateLineLengthPt}{3pt}
\makefootrule{pageWithLines}{\templateLineLengthPt}{3pt}{\footruleskip}

% ****************************************
\makepagestyle{pageWithLinesUnNumbered}
\makeevenfoot{pageWithLinesUnNumbered}{\vspace{-11pt}\includegraphics[width=.22\paperwidth]{\logoName}}{}{\deviceName}
\makeoddfoot{pageWithLinesUnNumbered}{\deviceName}{}{\vspace{-11pt}\includegraphics[width=.22\paperwidth]{\logoName}}
\makeevenhead{pageWithLinesUnNumbered}{}{}{}
\makeoddhead{pageWithLinesUnNumbered}{}{}{}

\makeheadfootruleprefix{pageWithLinesUnNumbered}{\color{\lineColor}}{\color{\lineColor}}
\makeheadrule{pageWithLinesUnNumbered}{\templateLineLengthPt}{3pt}
\makefootrule{pageWithLinesUnNumbered}{\templateLineLengthPt}{3pt}{\footruleskip}
% ****************************************

\makepagestyle{blankPage}
\makeoddhead{blankPage}{}{}{}
\makeevenhead{blankPage}{}{}{}
\makeevenfoot{blankPage}{}{\thepage}{}
\makeoddfoot{blankPage}{}{\thepage}{}


% ****************************************
\makepagestyle{backmatter}
\makeevenfoot{backmatter}{\vspace{-11pt}\includegraphics[width=.22\paperwidth]{\logoName}}{\thepage}{\deviceName}
\makeoddfoot{backmatter}{\deviceName}{\thepage}{\vspace{-11pt}\includegraphics[width=.22\paperwidth]{\logoName}}
\makeevenhead{backmatter}{}{}{}
\makeoddhead{backmatter}{}{}{}

\makeheadfootruleprefix{backmatter}{\color{\lineColor}}{\color{\lineColor}}
\makeheadrule{backmatter}{\templateLineLengthPt}{3pt}
\makefootrule{backmatter}{\templateLineLengthPt}{3pt}{\footruleskip}

%    ****************************************
%    *             FRONT MATTER             *
%    ****************************************
%


% The alwayssingle environment ensures that front matter is always
% single column even in a double-column document.

\newenvironment{alwayssingle}
  {\if@twocolumn\@restonecoltrue\onecolumn \else \@restonecolfalse\newpage \fi}
  {\if@restonecol \twocolumn \else \newpage \fi}

% \maketitle outputs the complete titlepage.  It requires all the
% above macros.  It is probably not correct for joint (e.g. UCSD/SDSU) degrees.

% Set the font that will be used in the front matter headings
\def\fmfont{\fontsize\@xiipt{14.5}\selectfont}
\def\fmsmallfont{\fontsize\@xiipt{14pt}\selectfont}

%\********************************************************************************
% Definition of front page
%\********************************************************************************
%Front Page

%\makeatletter
\newlength\drop
\newcommand*{\titleGM}{%
\thispagestyle{empty}
\begingroup% Gentle Madness
% \drop = 0.1\textheight
% \vspace*{\baselineskip}
\begin{center}
        \includegraphics[width = .8\paperwidth]{\logoName} %\newline \newline
\end{center}
\vfill
\hbox{%
  \hspace*{0.17\textwidth}%
  \rule{2pt}{\dimexpr\textheight-128pt\relax}%
  \hspace*{0.05\textwidth}%
  \parbox[b]{0.75\textwidth}{%
    \vbox{%
      {\HUGE\raggedright\@title\par}
      %{\Large\raggedright Designed by \@author\par }
      \vspace{0.04\textheight}
      \includegraphics[width = 0.5\paperwidth]{\productPic}
      \vspace{0.04\textheight}
      {\Huge\raggedright\secTitle\par}
      %\vspace{0.04\textheight}
      {\Large\raggedright\textbf{\edition}\par}
    }% end of vbox
  }% end of parbox
}% end of hbox
\vfill
\endgroup}
%\makeatother



%/************************************************************************************************
% Define description page
%************************************************************************************************/

\def\makeDescriptPage{
{\dsp
\begin{alwayssingle}
    \let\footnotesize\small
    \let\footnoterule\relax
    \thispagestyle{empty}
    \setcounter{page}{1}

    \null\vfil
  \begin{center}
    \fmfont
    \textbf{\@title}\par
    \medskip
    \edition\par
    \bigskip \medskip\par
    % designed by \par
    \bigskip \medskip
    {\@author} \par
\vspace{6ex}
\vspace{6ex}
    % {\@prevdegrees} \par
% \vspace{6ex}
    \bigskip
    \par
    \bigskip \medskip
    \bigskip \medskip
    \vspace{6ex}
    \vspace{6ex} \par
    {\vspace{1in}
        \company\par
     \smallskip \medskip
    }

  \end{center}

    \vfil\null
\end{alwayssingle}
\setcounter{footnote}{0}
}}

%************************************************************
% Make Introduction
%************************************************************

\def\makeIntro{
        {\ssp
			\input{\intro}

			\bigskip
			\strline{\lineColor}{.03cm}{350}

			\centering{
			\begin{tabular}{p{.35\textwidth}p{.65\textwidth}}
					& \\
					\@author & \company\\
					\authorTitle    & \addressA\\
					\phone  &  \addressB\\
					\email  &  \website
			\end{tabular}
			}}}

%************************************************************
% Make Legal
%************************************************************

\def\makeLegal{
        {\ssp
			\begin{alwayssingle}
					\include{\legal}
			\end{alwayssingle}
        }}


%************************************************************
% Make Last Page
%************************************************************

\def\makeLastPage{
	{\ssp
                \thispagestyle{pageWithLinesUnNumbered}
                \null
		\vfill

		\centering
		\framebox[\templateLineLengthPt][b]{
			\begin{tabular}{p{.55\textwidth}p{.35\textwidth}}
				\companyName & \addressA\\
				\website  & \addressB\\
				\companyEmail  &  \phone
			\end{tabular}
			}
		\vspace{-11pt}
	}
}

% FRONTMATTER environment
%
% The FRONTMATTER environment makes sure that page numbering is set
% correctly (roman, lower-case, starting at 3) for the front matter
% that follows the abstract.  It also resets page-numbering for
% the remainder of the dissertation (arabic, starting at 1).

\renewenvironment{frontmatter}
  {\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
  {\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}





%Safe \url with special characters
\makeatletter
\AtBeginDocument{%
        \newlength{\temp@x}%
        \newlength{\temp@y}%
        \newlength{\temp@w}%
        \newlength{\temp@h}%
        \def\my@coords#1#2#3#4{%
                \setlength{\temp@x}{#1}%
                \setlength{\temp@y}{#2}%
                \setlength{\temp@w}{#3}%
                \setlength{\temp@h}{#4}%
                \adjustlengths{}%
                \my@pdfliteral{\strip@pt\temp@x\space\strip@pt\temp@y\space\strip@pt\temp@w\space\strip@pt\temp@h\space re}}%
        \ifpdf
        \typeout{In PDF mode}%
        \def\my@pdfliteral#1{\pdfliteral page{#1}}% I don't know why % this command...
        \def\adjustlengths{}%
        \fi
        \ifxetex
        \def\my@pdfliteral #1{\special{pdf: literal direct #1}}% isn't equivalent to this one
        \def\adjustlengths{\setlength{\temp@h}{-\temp@h}\addtolength{\temp@y}{1in}\addtolength{\temp@x}{-1in}}%
        \fi%
        \def\Hy@colorlink#1{%
                \begingroup
                \ifHy@ocgcolorlinks
                \def\Hy@ocgcolor{#1}%
                \my@pdfliteral{q}%
                \my@pdfliteral{7 Tr}% Set text mode to clipping-only
                \else
                \HyColor@UseColor#1%
                \fi
        }%
        \def\Hy@endcolorlink{%
                \ifHy@ocgcolorlinks%
                \my@pdfliteral{/OC/OCPrint BDC}%
                \my@coords{0pt}{0pt}{\pdfpagewidth}{\pdfpageheight}%
                \my@pdfliteral{F}% Fill clipping path (the url's text) with
                % current color
                %
                \my@pdfliteral{EMC/OC/OCView BDC}%
                \begingroup%
                \expandafter\HyColor@UseColor\Hy@ocgcolor%
                \my@coords{0pt}{0pt}{\pdfpagewidth}{\pdfpageheight}%
                \my@pdfliteral{F}% Fill clipping path (the url's text)
                % with \Hy@ocgcolor
                \endgroup%
                \my@pdfliteral{EMC}%
                \my@pdfliteral{0 Tr}% Reset text to normal mode
                \my@pdfliteral{Q}%
                \fi
                \endgroup
        }%
}


\makeatother

\newtheorem{theorem}{Theorem}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{definition}{Definition}


\hyphenation{mar-gin-al-ia}

\setcounter{secnumdepth}{5}

\def\dsp{\def\baselinestretch{1.5}\large\normalsize}
\dsp

\chapterstyle{reparticle}
\endinput
