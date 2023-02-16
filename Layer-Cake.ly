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
  \repeat unfold 8 {r1}
  fs''1~fs1~fs2. e4 cs8. e8. cs8 a8. b8. gs8~gs2 a2
  fs8. g8. fs8 d8. e8. cs8 cs8 cs8. -"scale: D Major with a g#, down and repeat with C# & E, then go back up to a D Major?"
  r8. r2
  r1 r r r r r r r r
}

left = \relative c' {
  \global
  % Music follows here.
  \repeat unfold 16 {r1}
  \repeat unfold 8 {r1}
}
% ===================================


% =============== guitar ============
electricGuitar = \relative c' {
  \global
  % Music follows here.
  \repeat unfold 8 {r1}
  \break

  % first hook
  cs8-"start of melody" d a' g fs8. cs8. d8~ |
  d4. fs8 cs8. d16 r8 gs8~ |
  gs1~ |
  gs1 |
  a8. e8. fs8. d8 r8. a'8 |
  e8. fs16 r8 d8 r8 e4 ef16(d16) |
  cs1 ~ | cs1

  \break
  cs8-"here we go again..." d a' g fs8. cs8. d8~ |
  d4. fs8 cs8. d16 r8 gs8~ |
  gs1~ |
  gs1 |
  a8. b8. e,8. fs8 r8. r8 |
  a8. a16 r8 e8 r8 fs4 ef16(d16) |
  cs1 ~ | cs1

  \break
}
% ===================================


% =============== bass ==============
crazyplucking_b = \relative c, {
  % 2 bars: 8/4, each 2/4 = 4/8
  b8 b16 b a16 b8.
  fs8 fs16 fs a16 b8. |
  fs8 e16 fs e16 fs8.
  a8. a16 fs8 a8 |
}
crazyplucking_e = \relative c, {
  e'8 e8 d16 e8.
  b8 b8 d16 e8. | 
  b8 b8 a16 b8. 
  d8 d8 b16 d8 b16 |
}

% https://www.youtube.com/watch?v=EV24y6vSr0E
crazyplucking_b_real = \relative c, {
  b8. b16 a16 b16 r16 fs16 r8. fs16 a16 b16 r16 fs16 |
  r16 fs16 r16 fs16 e8 fs8 a a16 b16 r16 a16 b8 |
}
crazyplucking_e_real = \relative c, {
  e8. e16 d16 e16 r16 b16 r8. b16 d16 e16 r16 b16 |
  r16 b16 r16 b16 a8 b8 d d16 b16 r16 a16 a8 |
}
crazypluckings_bbeb = \relative c, {
  \crazyplucking_b_real
  \crazyplucking_b_real
  \crazyplucking_e_real
  \crazyplucking_b_real
}
electricBass = \relative c, {
  \global
  % Music follows here.
  b1~b1 b1~b1 b1 b2~b8 a4. b1 b1

  \crazypluckings_bbeb
  \crazypluckings_bbeb
  \crazypluckings_bbeb
  \crazypluckings_bbeb
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
