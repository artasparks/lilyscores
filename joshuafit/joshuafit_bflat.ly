%   http://leighverlag.blogspot.fr/2015/12/mimicking-real-book-look.html

\version "2.20.0"


#(set-global-staff-size 18)

\include "../jazzchords.ly"
\include "../lilyjazz.ly"

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

title = #"Joshua Fit the Battle of Jericho"
composer = #"Sydney Bechet"
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

theNotes = \transpose f g {
  \relative c' {
    \jazzOn
    \set Staff.midiInstrument = "flute"
    \key f \minor
    \showStartRepeatBar \bar "[|:"
    \repeat volta 2 {
      f8 e f g aes4 bes |
      c8 aes r8 c8 ~ c2 |
      bes8 g r bes ~ bes4 g8 bes |
      aes8 f r c'8 ~ c2  | \break

      f,8 e f g aes g aes bes |
      c8 aes r8 c8 ~ c4 c8 des |
      c8 c bes4 aes8 g4 f8 ~|
      f2 r2 \bar ":|][|:" \break

      f'2 c8 aes4 c8 ~ |
      c2. c8 c8 |
      f8 f4. c8 aes4 c8 ~ |
      c2. c8 c8 | \break

      f8 g f4 c8 aes4 c8 ~|
      c2 aes4 aes8 bes |
      c8 c bes4 aes8 g4 f8 ~ |
      f4. r8 r2 \bar ":|]"
    }
  }
}

theChords = \transpose f g {
  \chordmode {
    \repeat volta 4 {
      f1:m | f:m | c:7 | f:m |
      f1:m | f:m | c:7 | f:m |

      f1:m6 | c:7 | f:m6 | c:7 |
      f1:m6 | c:7 | c:7 | f:m |
    }
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
