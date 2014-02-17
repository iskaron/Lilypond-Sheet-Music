\version "2.14.2"
\include "deutsch.ly"

#(set-global-staff-size 17)

\header {
  title     = \markup \bold \italic "Duetto I"
  composer  = "Carl Philipp Stamitz"
  arranger  = "(1745-1801)"
  enteredby = "cellist (2014-02-17)"
  piece     = "Op. 27, Nr. 1"
}

voiceconsts = {
 \key d \major
% \clef "treble"
 \clef "bass"
% \numericTimeSignature
 \compressFullBarRests
 \set tupletSpannerDuration = #(ly:make-moment 1 4)
}

mihi = "clarinet"
milo = "bassoon"

introa = {                      \tempo "1. Allegro " 4=120 \time 2/2 }
introb = { \bar "||"            \tempo "2. Allegro " 4=100 \time 2/4 }
introc = { \bar "||" \pageBreak \tempo "3. Largo "   4=40  \time 2/2 }

\include "v1.ily"
\include "v2.ily"

music = \new StaffGroup <<
      \new Staff {
	\set Staff.midiInstrument = \mihi
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello I" }
	\transpose d g,, { \va }
      }

      \new Staff {
	\set Staff.midiInstrument = \milo
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello II" }
	\transpose d g,, { \vb }
      }
>>

\book {
  \score {
    \music
    \layout {}
  }

  \score {
    \unfoldRepeats \music

    \midi {
      \context {
        \Score
      }
    }
  }
}
