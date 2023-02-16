\version "2.24.0"
\language "english"

\header {
  title = "Layer Cake"
  subtitle = "v0.0.1"
}

global = {
  \key d \major
  \time 4/4
}


% =============== piano =============
right = \relative c'' {
  \global
  % Music follows here.
  \repeat unfold 8 {as,8 a fs g as8 a fs g}
  \repeat unfold 8 {r1}
}

left = \relative c' {
  \global
  % Music follows here.
  \repeat unfold 16 {r1}
}
% ===================================


% =============== guitar ============
electricGuitar = \relative c' {
  \global
  % Music follows here.
  \repeat unfold 8 {r1}
  cs8-"start of melody" d a' g fs8. cs8. d8~ |
  d4. fs8 cs8. d16 r8 gs8~ |
  gs1~ |
  gs1 |
  a8. e8. fs8. d8 r8. a'8 |
  e8. fs16 r8 d8 r8 e4 ef16(d16) |
  cs1
}
% ===================================


% =============== bass ==============
electricBass = \relative c, {
  \global
  % Music follows here.
  b1~b1 b1~b1 b1 b2~b8 a4. b1 b1
  b2 fs fs a
  b2 fs fs a
  e'2 b b d
  b2 fs fs a
}
% ===================================


% =========== layout stuff that nobody cares about or cares later ==========
electricBassPart = \new Staff \with {
  midiInstrument = "electric bass (finger)"
  instrumentName = "Electric bass"
} { \clef "bass_8" \electricBass }

pianoPart = \new PianoStaff \with {
  instrumentName = "Piano"
} <<
  \new Staff = "right" \with {
    midiInstrument = "acoustic grand"
  } \right
  \new Staff = "left" \with {
    midiInstrument = "acoustic grand"
  } { \clef bass \left }
>>

electricGuitarPart = \new Staff \with {
  midiInstrument = "electric guitar (clean)"
  instrumentName = "Electric guitar"
} { \clef "treble_8" \electricGuitar }

\score {
  <<
    \electricBassPart
    \pianoPart
    \electricGuitarPart
  >>
  \layout { }
  \midi {
    \tempo 4=120
  }
}
