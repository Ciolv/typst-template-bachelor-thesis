// Dictionary with acronyms
// Acronym is key, value is ("long version", "long version plural ending", "short version plural ending")
// Plural endings are optional, "s" is default
// Values have to be at least ("",) where the comma is important
#let acronyms = (
  API: ("Application Programming Interface", "s", "s"),
  PEBKAC: ("Problem Exists Between Keyboard And Chair", "", ""),
  acro: ("acronym",)
)

// The state which tracks the used acronyms
#let usedAcronyms = state("usedDic", (empty: false,))

// Check if acronym is in the acronym list
#let acronym_exists(ac) = {
  return acronyms.keys().contains(ac)
}

// The acronym itself
#let acronym_short(ac) = {
  return ac
}

// The acronyms meaning
#let acronym_long(ac) = {
  return acronyms.at(ac).at(0)
}

// The acronym in its plural
#let acronym_short_plural(ac) = {
  if (acronyms.at(ac).len() > 2) {
    return acronym_short(ac) + acronyms.at(ac).at(2)
  }
  return acronym_short(ac) + "s"
}

// The acronyms meaning in plural
#let acronym_long_plural(ac) = {
  if (acronyms.at(ac).len() > 1) {
    return acronym_long(ac) + acronyms.at(ac).at(1)
  }
  return acronym_long(ac) + "s"
}


// The acronyms meaning with its short form appended
// Used to introduce an acronym
#let acronym_full(ac) = {
  return acronym_long(ac) + " (" + acronym_short(ac) + ")"
}

// The acronyms meaning with its short form appended, both in plural
// Used to introduce an acronym
#let acronym_full_plural(ac) = {
  return acronym_long_plural(ac) + " (" + acronym_short_plural(ac) + ")"
}

// Error message to alert for undeclared acronym usage
#let acronym_error(ac) = {
  if(acronyms.keys().contains(ac) == false) {
    return rect(
      fill: red,
      inset: 8pt,
      radius: 4pt,
      [*Error*: Acronym *#ac* not found!],
    )
  }
}

// To mark an acronym as used in text
// Following usages of ac or acp will not provide the long version anymore
#let declare_acronym_used(ac) = {
  usedAcronyms.update(usedDic => {
    usedDic.insert(ac, true)
    return usedDic
  })
}

// The function which either shows the acronym or the full text for it
#let ac(ac) = {
  if (not acronym_exists(ac)) {
    return acronym_error(ac)
  }

  usedAcronyms.display(usedDic => {
    if(usedDic.keys().contains(ac)) {
      return acronym_short(ac)
    }
    return acronym_full(ac)
  });

  declare_acronym_used(ac)
}

// The function which either shows the acronym or the full text for it in plural
#let acp(ac) = {
  if (not acronym_exists(ac)) {
    return acronym_error(ac)
  }

  usedAcronyms.display(usedDic => {
    if(usedDic.keys().contains(ac)) {
      return acronym_short_plural(ac)
    }
    return acronym_full_plural(ac)
  });


    declare_acronym_used(ac)
}

// The acronym itself
#let acs(ac) = {
  if (not acronym_exists(ac)) {
    return acronym_error(ac)
  }

  usedAcronyms.display(usedDic => {
    return acronym_short(ac)
  });

  declare_acronym_used(ac)
}

// The acronym itself in plural
#let acsp(ac) = {
  if (not acronym_exists(ac)) {
    return acronym_error(ac)
  }

  usedAcronyms.display(usedDic => {
    return acronym_short_plural(ac)
  });

  declare_acronym_used(ac)
}

// The acronyms meaning
#let acl(ac) = {
  if (not acronym_exists(ac)) {
    return acronym_error(ac)
  }

  usedAcronyms.display(usedDic => {
    return acronym_long(ac)
  });

  declare_acronym_used(ac)
}

// The acronyms meaning in plural
#let aclp(ac) = {
  if (not acronym_exists(ac)) {
    return acronym_error(ac)
  }

  usedAcronyms.display(usedDic => {
    return acronym_long_plural(ac)
  });

  declare_acronym_used(ac)
}

// Print the acronym register/listing
// Only used acronyms will be printed
#let print_acronym_listing(outline_name) = {
  locate(loc => if (usedAcronyms.final(loc).len() > 1) {
    [
      // Acronym register title
      #v(1em)
      #heading(level: 1, numbering: none, outline_name)
      #v(0.5em)

      // Acronym register content
      #text(size: 1em, locate(loc => usedAcronyms.final(loc)
      .pairs()
      .filter(x => x.last())
      .map(pair => pair.first())
      .sorted()
      .map(key => grid(
          columns: (1fr, auto),
          gutter: 1em,
         strong(key), acronyms.at(key).at(0)
        )).join()))
    ]
  })
}
