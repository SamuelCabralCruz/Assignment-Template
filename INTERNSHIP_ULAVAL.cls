\ProvidesClass{GLO_ULAVAL}[2017/08/22 Customized class for Laval University internship reports]
\LoadClassWithOptions{report}

% Package Loading
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[french]{babel}
\RequirePackage[showframe=False, top=2.5 cm, bottom=2.5 cm, left=2.5 cm, right=2.5 cm]{geometry}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{titlepic}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage[table,dvipsnames]{xcolor}
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
%\RequirePackage{MnSymbol} %interference with amssymb
% http://ctan.mirror.rafal.ca/fonts/mnsymbol/MnSymbol.pdf
\RequirePackage{mathdots}
\RequirePackage{mathtools}
\RequirePackage{array}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{nomencl}
\makenomenclature
\renewcommand{\nomname}{Liste des symboles et abréviations}
% to be used with: makeindex main.nlo -s nomencl.ist -o main.nls
\RequirePackage[round,sort]{natbib}
\bibliographystyle{plainnat}
\RequirePackage[nottoc]{tocbibind}
\renewcommand{\listoffigures}{\begingroup
\tocfile{Liste des figures}{lof}
\endgroup}
\RequirePackage[page,toc,titletoc,title]{appendix}
\renewcommand\appendixname{Annexes}
\renewcommand\appendixpagename{Annexes}
\renewcommand\appendixtocname{Annexes}
\newcommand{\Annexeautorefname}{Annexe}
\RequirePackage{minted}
\renewcommand\listingscaption{Listage}
\usemintedstyle{borland}
\definecolor{mintedbackground}{rgb}{0.9,0.9,0.9}
\newminted{sas}{
bgcolor=mintedbackground,
fontfamily=tt,
linenos=true,
stepnumber=1,
numberfirstline=true,
numberblanklines=true,
numbersep=12pt,
numbersep=5pt,
gobble=0,
frame=leftline,
framerule=0.4pt,
framesep=2mm,
funcnamehighlighting=true,
tabsize=4,
obeytabs=false,
mathescape=false
samepage=false,
showspaces=false,
showtabs =false,
texcl=false}
\RequirePackage{listings}
\def\listingautorefname{Listage}
\providecommand{\listingautorefname}{Listage}
\renewcommand{\lstlistingname}{Listage}
\renewcommand\listoflistingscaption{Liste de listages}
\renewcommand{\listoflistings}{\begingroup
\listof{listing}{\listoflistingscaption}
\addcontentsline{toc}{chapter}{\listoflistingscaption}
\endgroup}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{enumitem}

% Code Generating the Title Page
\def\CourseTitle#1{\def\theCourseTitle{#1}}
\def\theCourseTitle{Titre du cours}
\def\CourseNumber#1{\def\theCourseNumber{#1}}
\def\theCourseNumber{Numéro du cours de stage}
\def\Session#1{\def\theSession{#1}}
\def\theSession{Session}
\def\BachelorDegree#1{\def\theBachelorDegree{#1}}
\def\theBachelorDegree{Baccalauréat en <Discipline>}
\def\Position#1{\def\thePosition{#1}}
\def\thePosition{Titre du poste}
\def\Company#1{\def\theCompany{#1}}
\def\theCompany{Nom de la compagnie}
\def\ReportType#1{\def\theReportType{#1}}
\def\theReportType{Type de rapport}
\def\DeliveryDate#1{\def\theDeliveryDate{#1}}
\def\theDeliveryDate{Date de remise}
\def\StudentName#1{\def\theStudentName{#1}}
\def\theStudentName{Nom de l'étudiant}
\def\StudentNumber#1{\def\theStudentNumber{#1}}
\def\theStudentNumber{Numéro de dossier}
\def\SupervisorName#1{\def\theSupervisorName{#1}}
\def\theSupervisorName{Nom du Superviseur}
\def\SupervisorPosition#1{\def\theSupervisorPosition{#1}}
\def\theSupervisorPosition{Titre du Superviseur}

\renewcommand{\maketitle}{
	\begin{titlepage}
	    \sffamily\large
	    \noindent
	    \begin{minipage}{0.495\textwidth}
       		\begin{flushleft}
				\includegraphics[width=\linewidth, height=0.115\textheight,keepaspectratio]{/home/samuel/Documents/GLO/Title_Page/fig/ULaval_FSG}
			\end{flushleft}
			\vfill
        \end{minipage} \hfill
	    \begin{minipage}{0.495\textwidth}
            \begin{flushright}
                \bfseries\normalsize
  				\theCourseTitle \\
				\theCourseNumber \\
				\theSession \\
				Baccalauréat en \theBachelorDegree
            \end{flushright}
	    \end{minipage}
		\begin{center}
            \vspace{3 cm}
						\textbf{\thePosition\ au sein de \theCompany} \\
		    \vspace{1 cm}
            \theReportType \\
            \vspace{4 cm}
            \textbf{Destinataire} \\[10 pt]
            Département des stages en milieu pratique
		\end{center}
		\vspace{4 cm}
		\begin{flushleft}
		    Date de remise: \theDeliveryDate \\
		\end{flushleft}
		\vspace{0.25 cm}
   		\rule{\textwidth}{2 pt} \\[0.5 cm]
		\normalsize
		\textbf{\theStudentName \hfill \theSupervisorName}\\
		\theStudentNumber \hfill \theSupervisorPosition
	\end{titlepage}}

% Default Addition of Pictures
\graphicspath{{./fig/}}
\newcommand{\AddPicture}[5][nolabel]{
	\begin{figure}[ht]
		\begin{center}
			\includegraphics[width=#2\textwidth, height=#3\textheight,keepaspectratio]{#4}
			\caption{#5}
			\ifthenelse{\equal{#1}{nolabel}}{}{\label{fig:#1}}
		\end{center}
	\end{figure}}

% Redifining the icons of itemize
\newcommand{\modifyItemize}{
	\renewcommand{\labelitemi}{\tiny $\blacktriangleright$}
	\renewcommand{\labelitemii}{\footnotesize $\bullet$}
	\renewcommand{\labelitemiii}{\tiny \ding{117}}
	\renewcommand{\labelitemiv}{\small $\star$}}
% \frenchbsetup{StandardItemLabels=true}

% Defining new column type for table environments
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\renewcommand{\tabularxcolumn}[1]{m{#1}}
\renewcommand\theadfont{\footnotesize\bfseries}
\renewcommand\theadgape{\Gape[0pt][0pt]}

% Notes:
% description environment options
% labelsep=3 cm, align=parleft, leftmargin=!
% style = nextline (see enumitem package documentation)
