\ProvidesClass{GLO_ULAVAL}[2017/08/22 Customized class for Laval University internship reports]
\LoadClassWithOptions{report}

%Package Loading
\RequirePackage[ansinew]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[french]{babel}
\RequirePackage[top=25mm, bottom=25mm, left=25mm, right=25mm]{geometry}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{titlepic}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{positioning,calc,arrows,shapes,snakes,automata,backgrounds,petri}
\RequirePackage{ifthen}
\RequirePackage{textpos}
\RequirePackage{calc}
\RequirePackage{tabularx}
\RequirePackage{xstring}
\RequirePackage{makecell}
\RequirePackage[colorlinks=true,allcolors=blue]{hyperref}
\RequirePackage{subfig}
\RequirePackage{pifont}
\RequirePackage[bottom]{footmisc}
%\RequirePackage{MnSymbol} %interference with amssymb http://ctan.mirror.rafal.ca/fonts/mnsymbol/MnSymbol.pdf
\RequirePackage{mathdots}
\RequirePackage{mathtools}
\RequirePackage{array}
\RequirePackage{multicol}

%Code Generating the Title Page
\newif\ifbTeam
\def\bool_Team{\bTeamtrue}
\def\TeamNumber#1{\def\theTeamNumber{#1}}
\def\theTeamNumber{Numéro de l'équipe}
\def\Author#1{\def\theAuthor{#1}}
\def\theAuthor{Cabral Cruz, Samuel \\ (111 006 369)}
\def\Course#1{\def\theCourse{#1}}
\def\theCourse{Nom du cours \\ XXX-0000}
\def\ProjectTitle#1{\def\theProjectTitle{#1}}
\def\theProjectTitle{Titre par défaut du projet}
\def\ReportTitle#1{\def\theReportTitle{#1}}
\def\theReportTitle{Titre par défaut du rapport}
\def\Teacher#1{\def\theTeacher{#1}}
\def\theTeacher{Nom du professeur}
\def\Department#1{\def\theDepartment{#1}}
\def\theDepartment{d'informatique et de génie logiciel}
\def\TrimesterYear#1{\def\theTrimesterYear{#1}}
\def\theTrimesterYear{Trimestre Année}
\newcounter{Nb_Teamates}
\setcounter{Nb_Teamates}{1}
\renewcommand{\and}{
	\\[\baselineskip]
	\stepcounter{Nb_Teamates}}
	
\renewcommand{\maketitle}{
	\begin{titlepage}
		\begin{flushleft}
			\includegraphics[width=0.25\textwidth, height=0.25\textheight,keepaspectratio]{C:/Users/Samuel/Documents/GLO/Title_Page/fig/ul_logo}
			\ifbTeam
					\hfill
				No d'équipe: \theTeamNumber
			\fi
		\end{flushleft}
		\begin{center}
			\scshape
			\theAuthor \\
				\ifnum\value{Nb_Teamates} = 1
					\vspace{3.5cm}
				\else 
					\ifnum\value{Nb_Teamates} = 2
						\vspace{2.5cm}
					\else 
						\vspace{1.5cm}
					\fi
				\fi
			\theCourse
				\vfill
			\textbf
			{
				\Large{\theProjectTitle} \\
				\large{\theReportTitle}
			}
				\vfill
			Travail présenté à \\ 
			\theTeacher
				\vfill
			Département \theDepartment \\
			Université Laval \\	
			\theTrimesterYear		
		\end{center}
	\end{titlepage}}

%Default Addition of Pictures
\graphicspath{{./fig/}}
\newcommand{\AddPicture}[4]{
	\begin{figure}[h]
		\begin{center}
			\includegraphics[width=#1\textwidth, height=#2\textheight,keepaspectratio]{#3}
			\caption{#4}
		\end{center}
	\end{figure}}

%Redifining the icons of itemize
\newcommand{\modifyItemize}{
	\renewcommand{\labelitemi}{\tiny $\blacktriangleright$}
	\renewcommand{\labelitemii}{\footnotesize $\bullet$}
	\renewcommand{\labelitemiii}{\tiny \ding{117}}
	\renewcommand{\labelitemiv}{\small $\star$}}

%Defining new column type for table environments
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\renewcommand\theadfont{\bfseries}

