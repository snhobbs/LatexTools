\ProvidesClass{checkList}
\LoadClass[11pt]{article}
\usepackage{wasysym}
\usepackage[left=0.50in,top=.5in,right=0.5in,bottom=.5in]{geometry} % Document margins

\usepackage{graphicx}
\graphicspath{images/}

\newcommand{\ra}{$\rightarrow$}

\setlength{\marginparwidth}{1.2in}
\let\oldmarginpar\marginpar
\renewcommand\marginpar[1]{\-\oldmarginpar[\raggedleft #1]%
{\raggedright #1}}

\newenvironment{checklist}{%
  \begin{list}{}{}% whatever you want the list to be
  \let\olditem\item
  \renewcommand\item{\large\olditem \ra \marginpar{\hspace{-1.2in}\huge$\Box$} }
  \newcommand\citem{\large\olditem \ra \marginpar{\hspace{-1.2in}\huge$\CheckedBox$} }
}{\end{list}}
