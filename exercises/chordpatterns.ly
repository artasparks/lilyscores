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

title = #"Chord Exercises"
composer = #"Joshuar"
meter = #"(Comfortable)"

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
  \key c \major
  {
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs \bar "||"
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs \bar "||"
    \rs \rs \rs \rs | \break
  } {
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs \bar "||"
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs |
    \rs \rs \rs \rs \bar "||"
    \rs \rs \rs \rs | \break
  }
}

theChords = \chordmode {
  \jazzOn
  \key c \major {
    \mark "Var. 1 (I, V, VII, VI)"
    g1 | d:m | f | c:m |
    aes | ees:m | fis | cis:m |
    a \break
  } {
    \mark "Var. 2 (I, V, VII, VI)"
    g1 | d:m | f | c:m |
    aes | ees:m | fis | cis:m |
    a \break
  }
}

\score {
  <<
    \new ChordNames \theChords
    \new Staff = vocals \theNotes
  >>
  \layout {
  }
  \midi {
    \tempo 4 = 88
  }
}
