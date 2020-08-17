% -- Encoding UTF-8 without BOM

\ProvidesClass{cv-style}[2015/02/27 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


\usepackage{enumitem}

%----------------------------------------------------------------------------------------
% Colors %
%----------------------------------------------------------------------------------------

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{1B1B1B}
\definecolor{gray}{HTML}{202020}
\definecolor{lightgray}{HTML}{707070}

\definecolor{blue}{HTML}{11ABB0}
\definecolor{red}{HTML}{FA2772}
\definecolor{orange}{HTML}{F06000}
\definecolor{green}{HTML}{A7E22E}
\definecolor{purple}{HTML}{9358FE}
\definecolor{aquamarine}{HTML}{36AF90}

\definecolor{date}{HTML}{A4A4A4}

\ifdefined\@cv@print
  \colorlet{blue}{gray}
  \colorlet{red}{gray}
  \colorlet{orange}{gray}
  \colorlet{green}{gray}
  \colorlet{purple}{gray}
  \colorlet{aquamarine}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%----------------------------------------------------------------------------------------
% Fonts %
%----------------------------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

%\newfontfamily\bodyfont{Roboto-Regular}[Path=fonts/]
%\newfontfamily\bodyfontit{Roboto-LightItalic}[Path=fonts/]
%\newfontfamily\thinfont{Roboto-Thin}[Path=fonts/]
%\newfontfamily\headingfont{RobotoCondensed-Bold}[Path=fonts/]

\newfontfamily\bodyfont{OpenSans-Regular-webfont}[Path=fonts/]
\newfontfamily\bodyfontit{OpenSans-Italic-webfont}[Path=fonts/]
\newfontfamily\thinfont{OpenSans-Light-webfont}[Path=fonts/]
\newfontfamily\headingfont{OpenSans-Bold-webfont}[Path=fonts/]
\newfontfamily\headingfontbold{OpenSans-ExtraBold-webfont}[Path=fonts/]

\defaultfontfeatures{Mapping=tex-text}
%\setmainfont[Mapping=tex-text, Color=textcolor, Path = fonts/]{Roboto-Light}
\setmainfont[Mapping=tex-text, Color=textcolor, Path = fonts/]{OpenSans-Light-webfont}

\newcommand{\italica}[1]{%
    {\color{gray}\bodyfontit #1}%
}

%----------------------------------------------------------------------------------------
% Icons (Font Awesome) %
%----------------------------------------------------------------------------------------
%\newfontfamily\FontAwesome{fontawesome-webfont}[Path=fonts/]
\RequirePackage[]{fontawesome}


%----------------------------------------------------------------------------------------
% Header %
%----------------------------------------------------------------------------------------

\RequirePackage{tikz}

\newcommand{\header}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2.5cm] (box) at (current page.north){};
    \node [anchor=center, below=-0.5cm] (name) at (box) {%
      \fontsize{40pt}{65pt}\color{header}%
      {\bodyfont #1}{\headingfont  #2}
    };
  \end{tikzpicture}
  \vspace{1cm}
  \vspace{-2\parskip}
}

%----------------------------------------------------------------------------------------
%	Last updated command %
%----------------------------------------------------------------------------------------

\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{polyglossia}

\newcommand{\sethyphenation}[3][]{%
  \sbox0{\begin{otherlanguage}[#1]{#2}
    \hyphenation{#3}\end{otherlanguage}}}
%\sethyphenation[<options>]{<language>}{<list of words separated by spaces>}

\setdefaultlanguage[variant=british]{english}
\def\lastupdatedtext{Last Updated on}

\setlength{\TPHorizModule}{0.01\paperwidth}
\setlength{\TPVertModule}{0.01\paperwidth}

\newcommand{\lastupdated}{
  \begin{textblock}{10}(11.3, 0.05)
    \raggedleft
    \fontsize{8pt}{10pt}\color{date}\thinfont
    \lastupdatedtext{} \today
  \end{textblock}}

%----------------------------------------------------------------------------------------
% Structure %
%----------------------------------------------------------------------------------------
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        orange\or%
        green\or%
        blue\or%
        red\or%
		cyan\or%
        purple\or%
		teal\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  {\par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{.75\parskip}}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\newcommand{\jobtitle}[1]{%
    {\color{gray}\bodyfontit #1}%
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
% List environment %
%----------------------------------------------------------------------------------------
\usepackage{calc}
\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  \parbox[t]{\textwidth-13.4cm}{%
    \centering\leavevmode\color{gray}#1%
  }&\parbox[t]{13.4cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}
  
\newcommand{\entryfp}[4]{%
  \parbox[t]{\textwidth-17cm}{%
    \centering\leavevmode\color{gray}#1%
  }&\parbox[t]{17cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

%----------------------------------------------------------------------------------------
% Side block %
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.8}(1, 2.36)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}




%----------------------------------------------------------------------------------------
% Other tweaks %
%----------------------------------------------------------------------------------------

\RequirePackage[left=5.2cm,top=1.5cm,right=1.5cm,bottom=1.0cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    pdftitle=Resume \textbar{} Jonathan Mash,
    pdfauthor=Jonathan Mash,
    pdfsubject=Resume%
    }