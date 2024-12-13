%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diplomarbeit hf-ict
% Class File
% Version 0.1 (2023-02-11)
% 
% hf-ict Class Download:
% https://github.com/StefanBau/HF-ICT-Template
% 
% Schulische Änderungen in der Verion 0.1 wurden durchgeführt durch:
% Stefan Baumgartner
%
% Original class was downloaded from:
% http://www.LaTeXTemplates.com
% 
% Authors:
% Vel (vel@latextemplates.com)
% Johannes Böttcher
%
% Notes:
% 1) This class file defines the structure and layout of the template file (main.tex).
% 2) It has been written in such a way that under most circumstances you should not need
% to edit it; updating it to a newer version will be harder. If you do make changes, please change the name of
% the file and add comments to make your changes more visible.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%   CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\newcommand{\classname}{Diplomarbeit}
\ProvidesClass{\classname}[2020/08/24 v1.7 LaTeXTemplates.com]
\providecommand{\baseclass}{book}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\newbool{nolistspace}
\newbool{chapteroneline}
\newbool{listtoc}
\newbool{toctoc}
\newbool{parskip}
\newbool{hyperrefsupport}
\booltrue{hyperrefsupport}
\newbool{headsepline}
\newbool{consistentlayout}

\DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption{headsepline}{\booltrue{headsepline}}
\DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax

\LoadClass{\baseclass}

%  Simple interface for the user  to customize the chapter titles 
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace*{40pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\raggedright}
\ProvideDocumentCommand{\chapterfont}{}{\Huge\bfseries}
\ProvideDocumentCommand{\chapterprefixfont}{}{\LARGE\bfseries}
\DeclareDocumentCommand{\@makechapterhead}{ m }{%
    \abovechapterskip
    {\parindent \z@ \chapteralign \normalfont
        \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
        \ifbool{chapteroneline}{%
            \chapterfont \mdtChapapp\thechapter\autodot\enspace
        }{%
            \chapterprefixfont \@chapapp\space \thechapter
            \par\nobreak
            \chapterinbetweenskip
        }%
        \fi
        \fi
        \interlinepenalty\@M%
        \chapterfont #1\par\nobreak
        \chapterbelowskip
    }
    \thispagestyle{\chapter@p@gestyle}
}
\def\@makeschapterhead#1{%
    \abovechapterskip
    {\parindent \z@ \chapteralign
        \normalfont
        \interlinepenalty\@M
        \chapterfont  #1\par\nobreak
        \chapterbelowskip
    }
    \thispagestyle{\chapter@p@gestyle}
}


% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addchap}{ s o m }{%
    \chapter*{#3}%
    \markboth{}{}%
    \IfBooleanTF{#1}{%
    }{%
        \IfNoValueTF{#2}{%
            \addchaptertocentry{#3}%
            \markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
        }{%
            \addchaptertocentry{#2}%
            \markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
        }%
    }%
}%

\ProvideDocumentCommand{\addsec}{ s o m }{%
    \section*{#3}%
    \markright{}%
    \IfBooleanTF{#1}{%
    }{%
        \IfNoValueTF{#2}{%
            \addcontentsline{toc}{section}{#3}%
            \markright{\MakeMarkcase{#3}}%%
        }{%
            \addcontentsline{toc}{section}{#2}%
            \markright{\MakeMarkcase{#2}}%
        }%
    }%
}%

%----------------------------------------------------------------------------------------
%   CLASS OPTIONS
%----------------------------------------------------------------------------------------

\ifbool{parskip}{\RequirePackage{parskip}} % If the parskip option is passed to the class, require the parskip package 

%Entfernt 2023-02-12
%\ifbool{listtoc}{% If the liststotoc option has been passed to the class, add the lists to the table of contents
%    \patchcmd{\listoftables}{\@starttoc{lot}}{%
%        \addchaptertocentry{\listtablename}\@starttoc{lot}%                    
%    }{}{}%
%    \patchcmd{\listoffigures}{\@starttoc{lof}}{%
%        \addchaptertocentry{\listfigurename}\@starttoc{lof}%
%    }{}{}%
%}

%\ifbool{toctoc}{% If the toctotoc options has been passed to the class, add the table of contents to the table of contents
%    \patchcmd{\tableofcontents}{\@starttoc{toc}%
%}{%
%    \addchaptertocentry{\contentsname}\@starttoc{toc}}{}{}%
%}
%
%\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
%\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
%\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
%\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
%\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
%\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

% If the option `nolistspacing' is given, the spacing in the different lists is reduced to single spacing. This option is only useful, if the spacing of the document has been changed to onehalfspacing or doublespacing.
%\ifbool{nolistspace}{
%   %Entfernt 2023-02-12
%   % \patchcmd{\listoffigures}{%
%   %     \@starttoc{lof}
%   % }{%
%   %    \begingroup%
%   %    \singlespace\@starttoc{lof}\endgroup%
%   %}{}{}%
%   %\patchcmd{\listoftables}{%                                                 %Entfernt 2023-02-12
%   %    \@starttoc{lot}
%   %}{%
%   %    \begingroup%
%   %    \singlespace\@starttoc{lot}\endgroup%
%   %}{}
%   {}%
%    \patchcmd{\tableofcontents}{%
%        \@starttoc{toc}
%    }{%
%        \begingroup%
%        \singlespace\@starttoc{toc}\endgroup%
%    }{}{}%
%}{}


%----------------------------------------------------------------------------------------
%   REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

%\RequirePackage{babel} % Required for automatically changing names of document elements to languages besides english

%\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements

% Load package scrhack, which provides fixes for various packages.
% Defer the loading, because scrhack should be loaded after other packages.
% See here for the problem: https://tex.stackexchange.com/questions/659887/
\AddToHook{begindocument/before}{\usepackage{scrhack}}
%\RequirePackage{scrhack}

\RequirePackage{setspace} % Required for changing line spacing

\RequirePackage{longtable} % Required for tables that span multiple pages (used in the symbols, abbreviations and physical constants pages)

\RequirePackage{siunitx} % Required for \SI commands

\RequirePackage{graphicx} % Required to include images
\graphicspath{{Figures/}{./}} % Specifies where to look for included images

\RequirePackage{booktabs} % Required for better table rules

\RequirePackage{caption} % Required for customising the captions
\captionsetup{justification=centerlast,font=small,labelfont=sc,margin=50pt}



%----------------------------------------------------------------------------------------
%   BENUTZERDEFINIERTE BEFEHLE FÜR DIE DIPLOMARBEIT DEFINIEREN:
%----------------------------------------------------------------------------------------

\NewDocumentCommand{\thesistitle} { o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\ttitle{#2}%
}
% Diverse Anpassungen an den Befehlen vorgenommen
\NewDocumentCommand{\thesistype}{m}{\newcommand{\ttype}{#1}}
\NewDocumentCommand{\thesisdate}{m}{\newcommand{\tdate}{#1}}
\NewDocumentCommand{\thesislocation}{m}{\newcommand{\tloc}{#1}}
\DeclareDocumentCommand{\author}{m}{\newcommand{\authorname}{#1}\renewcommand{\@author}{#1}}
\NewDocumentCommand{\authorclass}{m}{\newcommand{\authcls}{#1}}
\NewDocumentCommand{\supervisorA}{m}{\newcommand{\supnameA}{#1}}
\NewDocumentCommand{\supervisorAmail}{m}{\newcommand{\supmailA}{#1}}
\NewDocumentCommand{\supervisorAweb}{m}{\newcommand{\supwebA}{#1}}
\NewDocumentCommand{\supervisorAUni}{m}{\newcommand{\supuniA}{#1}}                                  % hinzugefügt: 2023-02-11
\NewDocumentCommand{\supervisorAinfo}{m}{\newcommand{\supinfoA}{#1}}
\NewDocumentCommand{\supervisorB}{m}{\newcommand{\supnameB}{#1}}
\NewDocumentCommand{\supervisorBmail}{m}{\newcommand{\supmailB}{#1}}
\NewDocumentCommand{\supervisorBweb}{m}{\newcommand{\supwebB}{#1}}
\NewDocumentCommand{\supervisorBUni}{m}{\newcommand{\supuniB}{#1}}                                  % hinzugefügt: 2023-02-11
\NewDocumentCommand{\supervisorBinfo}{m}{\newcommand{\supinfoB}{#1}}
\NewDocumentCommand{\examiner}{m}{\newcommand{\examname}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degreename}{#1}}
\NewDocumentCommand{\studyprogram}{m}{\newcommand{\studyprog}{#1}}
\NewDocumentCommand{\studyprogramlink}{m}{\newcommand{\studyproglink}{#1}}
\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\universitygerman}{m}{\newcommand{\univnameger}{#1}}
\NewDocumentCommand{\department}{m}{\newcommand{\deptname}{#1}}
\NewDocumentCommand{\institute}{m}{\newcommand{\instname}{#1}}
\NewDocumentCommand{\group}{m}{\newcommand{\groupname}{#1}}
\NewDocumentCommand{\subject}{m}{\newcommand{\subjectname}{#1}}
\NewDocumentCommand{\keywords}{m}{\newcommand{\keywordnames}{#1}}

\NewDocumentCommand{\universitylink}{m}{\newcommand{\univlink}{#1}}
\NewDocumentCommand{\universitylinkgerman}{m}{\newcommand{\univlinkger}{#1}}
\NewDocumentCommand{\departmentlink}{m}{\newcommand{\deptlink}{#1}}
\NewDocumentCommand{\institutelink}{m}{\newcommand{\instlink}{#1}}
\NewDocumentCommand{\grouplink}{m}{\newcommand{\grplink}{#1}}



\newcommand{\checktoopen}{% New command to move content to the next page which prints to the next odd page if twosided mode is active  
    \if@openright\cleardoublepage\else\clearpage\fi
    \ifdef{\phantomsection}{\phantomsection}{}% The \phantomsection command is necessary for hyperref to jump to the correct page
}

\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}

\newcommand{\HRule}{\rule{.9\linewidth}{.6pt}} % New command to make the lines in the title page
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}} % New command for a rule to be used under figures

\setcounter{tocdepth}{3} % The depth to which the document sections are printed to the table of contents
\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
    \addcontentsline{toc}{chapter}{#1}%
}

%----------------------------------------------------------------------------------------
%   COLOURS
%----------------------------------------------------------------------------------------

\usepackage{xcolor} % Required for specifying custom colours

\colorlet{mdtRed}{red!50!black}

%----------------------------------------------------------------------------------------
%   MARGINS
%----------------------------------------------------------------------------------------

\RequirePackage{geometry}
\geometry{
    headheight=4ex,
    includehead,
    includefoot
}

\raggedbottom

%----------------------------------------------------------------------------------------
%   PENALTIES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=10000 % Almost no widows at bottom of page
\clubpenalty=10000 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes

%----------------------------------------------------------------------------------------
%   HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\RequirePackage[markcase=used]{scrlayer-scrpage}
\providepairofpagestyles{thesisSimple}{%
    \clearpairofpagestyles%
    \automark[chapter]{chapter}
    \ihead{hf-ict}% Inner header
    \ohead{\ttitle}% Outer header
    \ifoot{\tdate, \authorname}% Inner footer
    \ofoot{\pagemark}% Outer footer
}
\ifoot{\tdate, \authorname}% Inner footer
\ofoot{\pagemark}% Outer footer
\pagestyle{thesisSimple}
\providepairofpagestyles[thesisSimple]{Diplomarbeit}{%
    \automark*[section]{}%
    \ihead{hf-ict}% Inner header
    \ohead{\ttitle}% Outer header
    \ifoot{\tdate, \authorname}% Inner footer
    \ofoot{\pagemark}% Outer footer
}
\providepairofpagestyles[thesisSimple]{review}{%
    \ihead{hf-ict}% Inner header
    \ohead{\ttitle}% Outer header
    \ifoot{\tdate, \authorname}% Inner footer
    \ofoot{\pagemark}% Outer footer
}
\pagestyle{Diplomarbeit}

\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}
\PreventPackageFromLoading[\ClassError{\classname}{Package `fancyhdr' is
incompatible\MessageBreak with this class}{The pagesyles are defined 
    using package `scrlayer-scrpage', please consult the\MessageBreak
KOMA-script documentation for details.}]{fancyhdr}


\newcommand{\blank@p@gestyle}{empty}
\newcommand{\chapter@p@gestyle}{Diplomarbeit}                       %geändert 2023-02-12, damit auch bei den Verzeichnissen die Kopf- und Fusszeilen angezeigt werden
\NewDocumentCommand{\blankpagestyle}{ m }{%
    \ClassWarning{\classname}{\string\blankpagestyle\space is
    obsolete,\MessageBreak use \string\setblankpagestyle \space  instead}\renewcommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{ m }{\renewcommand{\blank@p@gestyle}{#1}}
\NewDocumentCommand{\setchapterpagestyle}{ m }{\renewcommand{\chapter@p@gestyle}{#1}}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{\blank@p@gestyle}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi%
}


%----------------------------------------------------------------------------------------

\ifbool{hyperrefsupport}{% If the nohyperref class option has not been specified
\AtEndPreamble{\RequirePackage{hyperref}
\hypersetup{pdfpagemode={UseOutlines},
bookmarksopen=true,
bookmarksopenlevel=0,
hypertexnames=false,
colorlinks=true,% Set to false to disable coloring links
% citecolor=[rgb]{0.435, 0.031, 0},% The color of citations
% linkcolor=[rgb]{0.60, 0.043, 0},% The color of references to document elements (sections, figures, etc)
% urlcolor=[rgb]{0.733, 0.11, 0.063},% The color of hyperlinks (URLs)
citecolor=[rgb]{0, 0, 0},% The color of citations
linkcolor=[rgb]{0, 0, 0},% The color of references to document elements (sections, figures, etc)
urlcolor=[rgb]{0, 0, 0},% The color of hyperlinks (URLs)
pdfstartview={FitV},
unicode,
breaklinks=true,
}

\pdfstringdefDisableCommands{% If there is an explicit linebreak in a section heading (or anything printed to the pdf-bookmarks), it is replaced by a space
    \let\\\space%
}
    }
}{%nothing
}

%----------------------------------------------------------------------------------------

\endinput
% lazyLizardTracer