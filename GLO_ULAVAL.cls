\ProvidesClass{GLO_ULAVAL}[2017/01/24 Customized class for university projects]
\LoadClassWithOptions{report}

%Package Loading
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[french]{babel}
\RequirePackage[babel]{csquotes}
\RequirePackage{bibentry}
\RequirePackage[top=25mm, bottom=25mm, left=25mm, right=25mm]{geometry}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{titlepic}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{positioning,calc,arrows,shapes,snakes,automata,backgrounds,petri}
\RequirePackage{ifthen}
\RequirePackage{textpos}
\RequirePackage{calc}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{booktabs}
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

\RequirePackage[shortlabels]{enumitem}
\RequirePackage{changepage}
\RequirePackage{etoolbox}
\RequirePackage[section]{placeins}
\RequirePackage{karnaughmap}

\RequirePackage{minted}
\usemintedstyle{emacs}
\RequirePackage[babel]{csquotes}

% \newcommand\frenchTableCaption{Tableau}

% \RequiredPackage{appendix} leads to an error...?
\usepackage[page,toc,titletoc,title]{appendix}
\renewcommand\appendixname{Annexes}
\renewcommand\appendixpagename{Annexes}
\renewcommand\appendixtocname{Annexes}
\newcommand{\Annexeautorefname}{Annexe}

% \RequiredPackage{lscape} leads to an error...?
\usepackage{pdflscape}

\usepackage{listings}
\def\listingautorefname{Listage}
\providecommand{\listingautorefname}{Listage}
\renewcommand\listingscaption{Listage}
\renewcommand{\lstlistingname}{Listage}
\renewcommand\listoflistingscaption{Liste des listages}
\renewcommand{\listoflistings}{\begingroup
\listof{listing}{\listoflistingscaption}
\addcontentsline{toc}{chapter}{\listoflistingscaption}
\endgroup}
\newenvironment{longlisting}{\captionsetup{type=listing}}{}


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

% Get the document class path
\makeatletter
\def\thepwd@default{./}
\let\thepwd\thepwd@default
\let\theclasspath\@empty

\newcommand\getclasspath{%
    \begingroup
    \edef\filename{GLO_ULAVAL.cls}%
    \@onelevel@sanitize\filename%
    \let\thepwd\thepwd@default
    \let\theclasspath\@empty
    \IfFileExists{\jobname.fls}{%
        \openin\@inputcheck=\jobname.fls\relax
        \endlinechar\m@ne
        \readline\@inputcheck to \line
        \expandafter\getclasspath@extr\line\relax\relax\relax\relax\relax
        \expandafter\getclasspath@defs\expandafter{\filename}%
        \loop
            \readline\@inputcheck to \line
            \@onelevel@sanitize\line
            \expandafter\getclasspath@path\expandafter{\line}%
            \ifeof\@inputcheck
                \let\iterate\relax
            \fi
            \ifx\theclasspath\@empty
        \repeat
        \closein\@inputcheck
    }{%
        \PackageWarning{getclasspath}
            {The required recorder file (.fls) was not found.\MessageBreak
             Please compile with the '-recorder' option.\MessageBreak
             Occurred}%
    }%
    \ifx\theclasspath\@empty
        \let\theclasspath\thepwd
    \fi
    \edef\@tempa{%
        \def\noexpand\thepwd{\thepwd}%
        \def\noexpand\theclasspath{\theclasspath}%
    }%
    \expandafter
    \endgroup
    \@tempa
}
\def\getclasspath@extr#1#2#3#4#5\relax{%
    \edef\@tempa{\detokenize{#1#2#3}}%
    \edef\@tempb{\detokenize{PWD}}%
    \ifx\@tempa\@tempb
       \edef\thepwd{\detokenize{#4#5/}}%
    \fi
}

\begingroup
\catcode`I=12
\catcode`N=12
\catcode`P=12
\catcode`U=12
\catcode`T=12
\gdef\getclasspath@defs#1{%
    \def\getclasspath@@path ##1INPUT ##2#1\relax##3\relax##4\@nnil{%
        \ifx\@empty##4\@empty\else
            \def\theclasspath{##2}%
        \fi
    }%
    \def\getclasspath@path##1{%
        \getclasspath@@path##1\relax INPUT \@empty#1\relax{}\relax\@nnil
    }%
}
\endgroup
\makeatother
\getclasspath
\message{ClassPath: \theclasspath}
\def\figureFolder{fig}
\message{GraphicsPathDocumentClass: \theclasspath\figureFolder/}
\graphicspath{{\theclasspath\figureFolder/}{./\figureFolder/}{.}}

\renewcommand{\maketitle}{
	\begin{titlepage}
		\begin{flushleft}
			\includegraphics[width=0.25\textwidth, height=0.25\textheight,keepaspectratio]{ul_logo}
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

% Default Addition of Pictures
\newcommand{\AddPicture}[5][nolabel]{
	\begin{figure}[ht]
		\begin{center}
			\includegraphics[width=#2\textwidth, height=#3\textheight,keepaspectratio]{#4}
			\caption{#5}
			\ifthenelse{\equal{#1}{nolabel}}{}{\label{fig:#1}}
		\end{center}
	\end{figure}}

\newcommand{\AddPictureLandscape}[5][nolabel]{
    \begin{landscape}
      \begin{figure}
        \includegraphics[width=#2\hsize, height=#3\vsize]{#4}
        \caption{#5}
        \label{fig:#1}
      \end{figure}
    \end{landscape}}

% Default Answering to QA assignment
\newcommand{\QA}[2]{
  \textbf{Énoncé}
  \begin{adjustwidth}{2\parindent}{0pt}
    #1
  \end{adjustwidth}
  \vspace{\baselineskip}
  \hspace{\parindent}\textbf{Réponse}
  \begin{adjustwidth}{2\parindent}{0pt}
    #2
  \end{adjustwidth}}

% Running Terminal Command and Outputing Standard Output to LaTeX
\begingroup\makeatletter\endlinechar=\m@ne\everyeof{\noexpand}
\edef\x{\endgroup\def\noexpand\TeXpath{\@@input|"which tex " }}\x
\newcommand{\RunTerminal}[1]{
	\begin{minipage}{\linewidth}
		{\catcode`_=12 \ttfamily\input{|"#1"}}
	\end{minipage}}

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

%Specific Functions for MAT-1919
\newcounter{exercise}
\newenvironment{exercise}{
	\bigskip
	\addtocounter{exercise}{1}
	\noindent
	\textbf{Exercice \theexercise} \\}{}
\newcommand{\explanation}[1]{\hfill\langle\small\emph{#1}\rangle}
\newcommand{\explanationText}[1]{\hfill$\langle$\small\emph{#1}$\rangle$}
\newcommand{\CQFD}{\begin{flushright} \textbf{C.Q.F.D.} \end{flushright}}
\newcommand{\vrai}{\mbox{\texttt{vrai}}}
\newcommand{\faux}{\mbox{\texttt{faux}}}
\newcommand{\eqdef}{\overset{{\mbox{\rm\tiny def}}}{=}}
\newcommand{\tuple}[1]{\ensuremath{\left\langle #1 \right\rangle}}
%\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\newcommand{\indexFuncArrow}[2]{\overset{\uparrow}{\scalebox{0.8}{$#1(#2)$}}}
\newcommand{\venn}{
	\def\universe{(-2,-2) rectangle (2,1.65)}
	\def\circleS{(0,0) ++(150:0.75) circle (1)}
	\def\circleT{(0,0) ++(270:0.75) circle (1)}
	\def\circleW{(0,0) ++(30:0.75) circle (1)}
	\colorlet{circle edge}{red!50}
	\colorlet{circle area}{red!20}
	\colorlet{circle no area}{white}
	\tikzset{
		filled/.style={fill=circle area, draw=circle edge, thick},
		unfilled/.style={fill=circle no area, draw=circle edge, thick},
    	outline/.style={draw=circle edge, thick}
    }
    \newcounter{vecPosition}}
\newcommand{\vennDiag}[2]{
    \setcounter{vecPosition}{0}
	\begin{tikzpicture}[scale=0.75, every node/.style={transform shape}]
		\foreach \x in #1
		{
			\addtocounter{vecPosition}{1}
			\ifnum\x=1
				\ifnum\value{vecPosition}=1
					\begin{scope}
						\fill[filled] \universe;
						\fill[unfilled] \circleS;
						\fill[unfilled] \circleT;
						\fill[unfilled] \circleW;
					\end{scope}
				\fi
				\ifnum\value{vecPosition}=2
					\begin{scope}
						\clip \circleS;
						\fill[filled] \circleS;
						\fill[unfilled] \circleT;
						\fill[unfilled] \circleW;
					\end{scope}
				\fi
				\ifnum\value{vecPosition}=3
					\begin{scope}
						\clip \circleT;
						\fill[filled] \circleT;
						\fill[unfilled] \circleS;
						\fill[unfilled] \circleW;
					\end{scope}
				\fi
				\ifnum\value{vecPosition}=4
					\begin{scope}
						\clip \circleW;
						\fill[filled] \circleW;
						\fill[unfilled] \circleS;
						\fill[unfilled] \circleT;
					\end{scope}
				\fi
				\ifnum\value{vecPosition}=5
					\begin{scope}
						\clip \circleT;
						\fill[filled] \circleS;
						\clip \circleS;
						\fill[unfilled] \circleW;
					\end{scope}
				\fi
				\ifnum\value{vecPosition}=6
					\begin{scope}
						\clip \circleW;
						\fill[filled] \circleT;
						\clip \circleT;
						\fill[unfilled] \circleS;
					\end{scope}
				\fi
				\ifnum\value{vecPosition}=7
					\begin{scope}
						\clip \circleS;
						\fill[filled] \circleW;
						\clip \circleW;
						\fill[unfilled] \circleT;
					\end{scope}
				\fi
				\ifnum\value{vecPosition}=8
					\begin{scope}
						\clip \circleS;
						\clip \circleT;
						\clip \circleW;
						\fill[filled] \circleS;
					\end{scope}
				\fi
			\fi
		}
		\draw \universe node[xshift=-10pt,yshift=-10pt] at (current bounding box.north east) {$\mathbf{U}$};
		\draw[outline] \circleS  node[text=black,above left]{$S$};
		\draw[outline] \circleT  node[text=black,below]{$T$};
		\draw[outline] \circleW  node[text=black,above right]{$W$};
		\draw node[xshift=0pt,yshift=-10pt] at (current bounding box.south) {#2};
	\end{tikzpicture}}

%Specific Functions for GIF-1003
\newcounter{countErrInv}
\newcommand{\ErrCateg}[1]{
	%1:erreur de syntaxe
	%2:mise en garde à corriger
	%3:mauvaise pratique
	%4:erreur dédition de lien
	%5:erreur de logique
		\ifnum\pdfstrcmp{#1}{syntaxe}=0
			\def\typeErreur{Erreur de syntaxe}
		\fi
		\ifnum\pdfstrcmp{#1}{warning}=0
			\def\typeErreur{Mise en garde à corriger}
		\fi
		\ifnum\pdfstrcmp{#1}{practice}=0
			\def\typeErreur{Mauvaise pratique}
		\fi
		\ifnum\pdfstrcmp{#1}{links}=0
			\def\typeErreur{Erreur d'édition de lien}
		\fi
		\ifnum\pdfstrcmp{#1}{logic}=0
			\def\typeErreur{Erreur de logique}
		\fi}
\newenvironment{ErrInv}[7]{
	\bigskip
	\addtocounter{countErrInv}{1}
	\section{Erreur \thecountErrInv}
	\ErrCateg{#1}

	\subsection{Identification}
		\noindent
		\textbf{Catégorie d'erreur :} \typeErreur \\

		\AddPicture{1}{0.2}{Message_Err_\thecountErrInv}{Message d'erreur de la console -- Erreur \thecountErrInv}
		\noindent
		#2
	\subsection{Localisation}
		\noindent
		Comme indiqué dans le message, le problème semble être situé dans le fichier \\
		#3
	\subsection{Solution proposée}
		\noindent
		#4
		\begin{figure}[h]
			\begin{minipage}{\linewidth}
				\begin{center}
				\subfloat[Avant Correction]{
				\includegraphics[width=#5\textwidth, height=#6\textheight,keepaspectratio]{Code_Before_Err_\thecountErrInv}}
					\qquad
				\subfloat[Après Correction]{
				\includegraphics[width=#5\textwidth, height=#6\textheight,keepaspectratio]{Code_After_Err_\thecountErrInv}}
				\end{center}
			\end{minipage}
			\caption{Code source -- Erreur \thecountErrInv}
		\end{figure}
	\subsection{Justification}
		\noindent
		#7
	}{}
\newenvironment{ErrInvCustom}[6]{
	\bigskip
	\addtocounter{countErrInv}{1}
	\section{Erreur \thecountErrInv}
	\ErrCateg{#1}

	\subsection{Description}
		\noindent
		\textbf{Catégorie d'erreur :} \typeErreur \\

		\noindent
		#2
	\subsection{Solution proposée}
		\noindent
		#3
		\begin{figure}[h]
			\begin{minipage}{\linewidth}
				\begin{center}
				\subfloat[Avant Correction]{
				\includegraphics[width=#4\textwidth, height=#5\textheight,keepaspectratio]{Code_Before_Err_\thecountErrInv}}
					\qquad
				\subfloat[Après Correction]{
				\includegraphics[width=#4\textwidth, height=#5\textheight,keepaspectratio]{Code_After_Err_\thecountErrInv}}
				\end{center}
			\end{minipage}
			\caption{Code source -- Erreur \thecountErrInv}
		\end{figure}
	\subsection{Justification}
		\noindent
		#6
	}{}

% Specific functions for GIF-1002
\newcommand{\verityTable}[3][nolabel]{
	\begin{table}[ht]
		\centering
    % \rowcolors{2}{gray!25}{white}
		\begin{tabular}{>{\bfseries}ccccc>{\bfseries}c}
			% \toprule
				\thead{Rang} & \thead{D} & \thead{C} & \thead{B} & \thead{A} & \thead{F} \\
			\midrule
				0  & 0 & 0 & 0 & 0 & \StrChar{#2}{1} \\
				1  & 0 & 0 & 0 & 1 & \StrChar{#2}{2} \\
				2  & 0 & 0 & 1 & 0 & \StrChar{#2}{3} \\
				3  & 0 & 0 & 1 & 1 & \StrChar{#2}{4} \\
				4  & 0 & 1 & 0 & 0 & \StrChar{#2}{5} \\
				5  & 0 & 1 & 0 & 1 & \StrChar{#2}{6} \\
				6  & 0 & 1 & 1 & 0 & \StrChar{#2}{7} \\
				7  & 0 & 1 & 1 & 1 & \StrChar{#2}{8} \\
				8  & 1 & 0 & 0 & 0 & \StrChar{#2}{9} \\
				9  & 1 & 0 & 0 & 1 & \StrChar{#2}{10} \\
				10 & 1 & 0 & 1 & 0 & \StrChar{#2}{11} \\
				11 & 1 & 0 & 1 & 1 & \StrChar{#2}{12} \\
				12 & 1 & 1 & 0 & 0 & \StrChar{#2}{13} \\
				13 & 1 & 1 & 0 & 1 & \StrChar{#2}{14} \\
				14 & 1 & 1 & 1 & 0 & \StrChar{#2}{15} \\
				15 & 1 & 1 & 1 & 1 & \StrChar{#2}{16} \\
			% \bottomrule
		\end{tabular}
		\caption{#3}
		\ifthenelse{\equal{#2}{nolabel}}{}{\label{fig:#1}}
	 \end{table}}

%Full Ref for unnumbered chapters
\newcommand{\fullref}[1]{\hyperref[#1]{\autoref*{#1}\nameref*{#1}}}

%Add unnumbered chapter to toc (create label opt)
\newcommand{\unnumberedChapter}[2][nolabel]{
	\chapter*{#2}
	\addcontentsline{toc}{chapter}{#2}
	\label{chap:#1}}

%Add unnumbered section to toc (create label opt)
\newcommand{\unnumberedSection}[2][nolabel]{
	\section*{#2}
	\addcontentsline{toc}{section}{#2}
	\label{sec:#1}}

%Add unnumbered subsection to toc (create label opt)
\newcommand{\unnumberedSubsection}[2][nolabel]{
	\subsection*{#2}
	\addcontentsline{toc}{subsection}{#2}
\label{subsec:#1}}
