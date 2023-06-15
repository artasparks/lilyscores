\version "2.20.0"

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


melody = \relative {
  e' | a, a a c | e e e2. e8 |
}

text = \lyricmode {
  \set stanza = There
}

\score {
  <<
    \new Voice = "one" { \melody }
    \new Lyrics \lyricsto "one" \text
  >>
  \layout { }
}

\markup {
  \column {
    \line { Verse 2. }
    \line { There was a ship that put to sea, }
    \line { The name of the ship was the Billy of Tea }
    \line { The winds blew up, her bow dipped down, }
    \line { O blow, my bully boys, blow. }
    \vspace #0.5
  }

  \column {
    \line { Verse 2. }
    \line { There was a ship that put to sea, }
    \line { The name of the ship was the Billy of Tea }
    \line { The winds blew up, her bow dipped down, }
    \line { O blow, my bully boys, blow. }
    \vspace #0.5
  }
}
