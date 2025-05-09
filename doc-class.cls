\LoadClass[10pt, a4paper]{article}

% Packages:
\usepackage[
   ignoreheadfoot, % set margins without considering header and footer
   top=2 cm, % seperation between body and page edge from the top
   bottom=2 cm, % seperation between body and page edge from the bottom
   left=2 cm, % seperation between body and page edge from the left
   right=2 cm, % seperation between body and page edge from the right
   footskip=1.0 cm, % seperation between body and footer
   % showframe % for debugging 
]{geometry} % for adjusting page geometry
\usepackage[explicit]{titlesec} % for customizing section titles
\usepackage{tabularx} % for making tables with fixed width columns
\usepackage{array} % tabularx requires this
\usepackage[dvipsnames]{xcolor} % for coloring text

% Define colors:
\definecolor{primaryColor}{RGB}{0, 51, 204}
\definecolor{secondaryColor}{RGB}{0, 0, 0}
\usepackage{enumitem} % for customizing lists
\usepackage{fontawesome5} % for using icons
\usepackage{amsmath} % for math
\usepackage[
   pdftitle={Shanelka Pramuditha's CV},
   pdfauthor={Shanelka Pramuditha},
   colorlinks=true,
   urlcolor=primaryColor
]{hyperref} % for links, metadata and bookmarks
\usepackage[pscoord]{eso-pic} % for floating text on the page
\usepackage{calc} % for calculating lengths
\usepackage{bookmark} % for bookmarks
\usepackage{lastpage} % for getting the total number of pages
\usepackage{changepage} % for one column entries (adjustwidth environment)
\usepackage{paracol} % for two and three column entries
\usepackage{ifthen} % for conditional statements
\usepackage{needspace} % for avoiding page brake right after the section title
\usepackage{iftex} % check if engine is pdflatex, xetex or luatex
\usepackage{graphicx} % add images

% Ensure that generate pdf is machine readable/ATS parsable:
\ifPDFTeX
   \input{glyphtounicode}
   \pdfgentounicode=1
   \usepackage[T1]{fontenc}
   \usepackage[utf8]{inputenc}
   \usepackage{lmodern}
\fi

\usepackage[default, type1]{sourcesanspro}

\usepackage{tikz} % for drawing tags
\usepackage{xcolor} % for color customization
% \usepackage{fontawesome} % for icons
\usepackage{hyperref} % for hyperlinks

% Some settings:
\AtBeginEnvironment{adjustwidth}{\partopsep0pt} % remove space before adjustwidth environment
\pagestyle{empty} % no header or footer
\setcounter{secnumdepth}{0} % no section numbering
\setlength{\parindent}{0pt} % no indentation
\setlength{\topskip}{0pt} % no top skip
\setlength{\columnsep}{0.15cm} % set column seperation
\makeatletter
\let\ps@customFooterStyle\ps@plain % Copy the plain style to customFooterStyle
\patchcmd{\ps@customFooterStyle}{\thepage}{
   \color{gray}\textit{\small Shanelka Pramuditha - Page \thepage{} of \pageref*{LastPage}}
}{}{} % replace number by desired string
\makeatother
\pagestyle{customFooterStyle}

\titleformat{\section}{
   % avoid page braking right after the section title
   \needspace{4\baselineskip}
   % make the font size of the section title large and color it with the primary color
   \Large\color{primaryColor}
}{
}{
}{
   % print bold title, give 0.15 cm space and draw a line of 0.8 pt thickness
   % from the end of the title to the end of the body
   \textbf{#1}\hspace{0.15cm}\titlerule[0.8pt]\hspace{-0.1cm}
}[] % section title formatting

\titlespacing{\section}{
   % left space:
   -1pt
}{
   % top space:
   0.3 cm
}{
   % bottom space:
   0.2 cm
} % section title spacing

% \renewcommand\labelitemi{$\vcenter{\hbox{\small$\bullet$}}$} % custom bullet points
\newenvironment{highlights}{
   \begin{itemize}[
         topsep=0.10 cm,
         parsep=0.10 cm,
         partopsep=0pt,
         itemsep=0pt,
         leftmargin=0.4 cm + 10pt
      ]
      }{
   \end{itemize}
} % new environment for highlights

\newenvironment{highlightsforbulletentries}{
   \begin{itemize}[
         topsep=0.10 cm,
         parsep=0.10 cm,
         partopsep=0pt,
         itemsep=0pt,
         leftmargin=10pt
      ]
      }{
   \end{itemize}
} % new environment for highlights for bullet entries


\newenvironment{onecolentry}{
   \begin{adjustwidth}{
         0.2 cm + 0.00001 cm
      }{
         0.2 cm + 0.00001 cm
      }
      }{
   \end{adjustwidth}
} % new environment for one column entries

\newenvironment{twocolentry}[2][]{
   \onecolentry
   \def\secondColumn{#2}
   \setcolumnwidth{\fill, 4.5 cm}
   \begin{paracol}{2}
      }{
      \switchcolumn \raggedleft \secondColumn
   \end{paracol}
   \endonecolentry
} % new environment for two column entries

\newenvironment{threecolentry}[3][]{
   \onecolentry
   \def\thirdColumn{#3}
   \setcolumnwidth{2 cm, \fill, 4.5 cm}
   \begin{paracol}{3}
      {\raggedright #2} \switchcolumn
      }{
      \switchcolumn \raggedleft \thirdColumn
   \end{paracol}
   \endonecolentry
} % new environment for three column entries

\newenvironment{header}{
   \setlength{\topsep}{0pt}\par\kern\topsep\color{secondaryColor}\linespread{1.5}
}{
   \par\kern\topsep
} % new environment for the header

\newcommand{\placelastupdatedtext}{% \placetextbox{<horizontal pos>}{<vertical pos>}{<stuff>}
   \AddToShipoutPictureFG*{% Add <stuff> to current page foreground
      \put(
      \LenToUnit{\paperwidth-2 cm-0.2 cm+0.05cm},
      \LenToUnit{\paperheight-1.0 cm}
      ){\vtop{{\null}\makebox[0pt][c]{
               \small\color{gray}\textit{Last updated in Jan 2025}\hspace{\widthof{Last updated in Jan 2025}}
            }}}%
   }%
}%

% save the original href command in a new command:
\let\hrefWithoutArrow\href

% new command for external links:
\renewcommand{\href}[2]{\hrefWithoutArrow{#1}{\mbox{\ifthenelse{\equal{#2}{}}{ }{#2 }\raisebox{.15ex}{\footnotesize \faExternalLink*}}}}

% Define a command for section headers with icon
% Syntax: \sectionheader{<icon command>}{<section title>}
\newcommand{\sectionheader}[2]{%
   \section[#2]{#1\hspace{0.5em}#2}%
}

% Define a command for slim rounded labels
% Syntax: \labeltag{<label text>}
\newcommand{\labeltag}[1]{%
   \begin{tcolorbox}[colback=white, colframe=black!50, boxrule=0.5mm, arc=3mm, auto outer arc, width=fit, height=1cm, left=2mm, right=2mm, top=0mm, bottom=0mm, boxsep=1mm]
      \centering \footnotesize #1
   \end{tcolorbox}%
}

% Create a tag
% Usage: \cvtag{<tag label>}
\newcommand{\cvtag}[1]{%
   \tikz[baseline]\node[anchor=base,draw=primaryColor!70,rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.3ex,text depth=.25ex]{#1};
}