\version "2.20.0"

#(set-global-staff-size 18)

% \include "../jazzchords.ly"
\include "../lilyjazz.ly"

% \language "english"

\paper {
  #(define fonts
     (set-global-fonts
      #:roman "LilyJAZZText"
      #:sans "LilyJAZZText"
      #:factor (/ staff-height pt 20)))
}

\paper {
  #(set-paper-size "letter")
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Demon Kitty Rag"
composer = #"Katzenjammer"
meter = #"(Med. Swing)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
          \override #'(offset . 7)
          \override #'(thickness . 6)
          \underline \sans #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \once \override Staff.Clef.stencil = ##f
      \once \override Staff.TimeSignature.stencil = ##f
      \once \override Staff.KeySignature.stencil = ##f
      ragged-right = ##f
      \override TextScript.font-name = #"LilyJAZZText"
    }
  }
}

\header {
  title = \realBookTitle
  tagline = ##f
}

theNotes = \relative c' {
  \jazzOn
  \set Staff.midiInstrument = "flute"
  \key f \minor
  {
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
  }
  \showStartRepeatBar
  \repeat volta 2 {
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs | \break

    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |

    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs | \break

    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
  } {
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |

    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \mark "D.C."
    \bar
    "|."
  }
}

theChords = \chordmode {
  \jazzOn
  \key f \minor
  \repeat volta 4 {
    d1:m | bes | a | d:m

    d1:m | bes | a | d:m
    d1:m | bes | a | d:m
    d1:m | bes | a | d:m
    d1:m | bes | a | d:m

    g | d:m | g | d:m |
    g | d:m | f | a:7
  }
}

\score {
  <<
    \new ChordNames \theChords
    \new Staff = vocals \theNotes
  >>
  \layout {
    % make only the first clef visible

    \override Score.Clef #'break-visibility = #'#(#f #f #f)

    % make only the first time signature visible
    \override Score.KeySignature #'break-visibility = #'#(#f #f #f)

    % allow single-staff system bars
    \override Score.SystemStartBar #'collapse-height = #1
    \override LyricHyphen.thickness = #4
    \override Score.VoltaBracket.font-name = #"LilyJAZZText"
  }
  \midi {
    \tempo 4 = 88
  }
}
