#import "acronyms.typ": ac,acl,acs,acsp,acp,aclp,acronyms // allows LaTeX "acro" like acronym management with only basic features
#import "helper.typ": page_ref
#import "config.typ": conf
#show: doc => conf(
  title: "GIVE IT A NICE TITLE",
  authors: (
    (
      name: "Author Name",
      company: "Example Company",
      matriculation_number: "1234567",
      department: "Example Department",
      course: "Example course",
      course_administrator: "Course Administrator",
      scientific_advisor: "Scientific Advisor",
      company_advisor: "Company Advisor",
      period: "Editing period",
      submission_date: "Submission date",
    ),
  ),
  university: "Junivercity",
  abstract: [#lorem(150)],
  language: "en",
  font: "Manrope",
  outlines: (
    ("List of figures", image),
    ("List of tables", image),
    ("List of listings", raw)
  ),
  acronym_outline_name: "List of abbreviations",
  thesis_type: "Bachelor Thesis",
  course_of_studies: "Course of studies - WOW",
  field_of_studies: "Field of studies - Interesting",
  company_logo: (path: "Company-logo.png", alternative_text: "Company Logo"),
  university_logo: (path:"University-logo.png", alternative_text: "University Logo"),
  declaration_on_honour: true,
  bibliography-file: "references.yml",
  bibliography-style: "ieee",
  doc,
)

= This is a chapter headline

For real information, see @chap:useful-guides[chapter] on page #page_ref(<chap:useful-guides>). \

== Let's create a section

#lorem(12)

=== And a subsection

#lorem(80)

=== Yet another subsection

#lorem(10)

== How about another section

#lorem(10)

==== Now we are going really deep

#lorem(80)


#include "chapter.typ"
