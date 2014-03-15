\version "2.14.2"
\include "deutsch.ly"

#(set-global-staff-size 17)

\header {
  title     = \markup \bold \italic "Triosonate in c-moll"
  subtitle  = "(im Original für zwei Geigen und Bratsche)"
  composer  = "Johann Joachim Quantz (1697-1773)"
  arranger  = "arr.: Mikio Kamada"
  enteredby = "cellist (2014-03-15)"
}

voiceconsts = {
  \key c \minor
  %\numericTimeSignature
  \compressFullBarRests
}

mihi = "clarinet"
milo = "bassoon"

introa = {        \tempo "1. Andante moderato " 4=70  \time 4/4 }
introb = { \break \tempo "2. Allegro "          4=100 \time 2/4 }
introc = { \break \tempo "3. Larghetto "        4=60  \time 3/4 }

boxa = { \bar "||" \mark \markup \box "A" }
boxb = { \bar "||" \mark \markup \box "B" }
boxc = { \bar "||" \mark \markup \box "C" }
boxd = { \bar "||" \mark \markup \box "D" }
boxe = { \bar "||" \mark \markup \box "E" }
boxf = { \bar "||" \mark \markup \box "F" }
boxg = { \bar "||" \mark \markup \box "G" }
boxh = { \bar "||" \mark \markup \box "H" }
boxi = { \bar "||" \mark \markup \box "I" }
boxj = { \bar "||" \mark \markup \box "J" }

rit = \markup \bold \italic "rit."

\include "v1.ily"
\include "v2.ily"
\include "v3.ily"

music = \new StaffGroup <<
      \new Staff {
	\set Staff.midiInstrument = \mihi
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello I" }
	\transpose c d, { \va }
      }

      \new Staff {
	\set Staff.midiInstrument = \milo
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello II" }
	\transpose c d, { \vb }
      }

      \new Staff {
	\set Staff.midiInstrument = \milo
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello III" }
	\transpose c d, { \vc }
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
