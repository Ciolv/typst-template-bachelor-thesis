# Bachelor Thesis TypstTemplate - DHBW Mannheim

**This template is not affiliated with DHBW Mannheim.**  
It is intended to be used as a template for the bachelor thesis at the computing faculty in accordance to the 2019 guidelines.  

If you intend to use the template, please double-check it's accordance to the guidelines, there might be a newer version!  

The templates is created for a thesis in German, but provides most of its content in English as well, when `language: "en"` is set.  
Adopting to another language should be quite easy, if you have some experience with typst or programming in general.

The layout is inspired by [DHBW LaTeX Template](https://github.com/pfisterer/DHBW_LaTeX_Template).

## Usage

Check out the [Typst Repository](https://github.com/typst/typst) and the [Typst Documentation](https://typst.app/docs/) to get started.  
I'm using a `cargo` install on a local machine, writing in [VS Code](https://code.visualstudio.com/).  
The [Typst App](https://typst.app/) works as well, but I was facing some stability issues.  

For a local install, clone the Repo:  
```shell
git clone https://github.com/Ciolv/typst-template-bachelor-thesis
```

and open it:  

```shell
code ./typst-template-bachelor-thesis
```

## Structure  

The template itself is located in `config.typ`.  
`main.typ` uses the template for a sample document.  
For a project in German or English, the config parameters in `main.typ` should be sufficient. Other languages might require adjustions in `cofig.typ`.  
`helper.typ` containes small helper functions.  
`acronyms.typ` attempts to provide some acronym / abbreviation handeling, inspired by the LaTeX `acro` package.  

## Configuration  

`title`: Provide the title string, to print it to the title page.  

`authors`: Only one author is supported by this template. Every value set to `none` will not be displayed on the title page. 
```typ
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
```

`university`: Your university name, to print it to the title page.  

`abstract`:  As a content block. `none` will suppress the abstract page from being printed at all.  

`language`: No matter what language you are writing in, set the [ISO 639](https://en.wikipedia.org/wiki/ISO_639) language code to enable [smart quotes](https://typst.app/docs/reference/text/smartquote/).  

`font`: Set your favourite font. I've got some issues with numbers with mutliple fonts, so I use `Manrope`. I don't know if it's a Typst bug or a template bug at the moment, requires more investigation.  

`outlines`: Provide pairs of type `("Outline name", kind)` to auto create an outline for `figures`, see [kind](https://typst.app/docs/reference/meta/figure/#parameters--kind) and [outline](https://typst.app/docs/reference/meta/outline/) for more information. The outline will only be printed, if at least one `figure` of its `kind` is in the text.  
Commonly, the following parameters should be sufficient:

```typ
outlines: (
  ("List of figures", image),
  ("List of tables", image),
  ("List of listings", raw)
),
```

`acronym_outline_name`: The outline title for acronyms. Configured outside of the `outlines` parameter, since it is not based on `figure`.  

`thesis_type`: e. g. Bachelor Thesis or Project Thesis printed on the title page. `none` suppresses printing.  

`course of studies`: Your course of studies printed on the title page, e.g. Computer Science. `none` suppresses printing.  

`field_of_studies`: Your field of studies printed on the title page, e.g. Cyber Security. `none` suppresses printing.  

`company_logo`: Dictionary with `path` to an image file and `alternative_text` for the [`alt`](https://typst.app/docs/reference/visualize/image/#parameters--alt) parameter, printed on the title page. `none` suppresses printing.  

`university_logo`: Dictionary with `path` to an image file and `alternative_text` for the [`alt`](https://typst.app/docs/reference/visualize/image/#parameters--alt) parameter, printed on the title page. `none` suppresses printing.  

`declaration_on_honour`: [`Boolean`](https://typst.app/docs/reference/types/boolean/) value, to print or suppress printing of a declaration on honour. German and English text is provided and toggeled via the `language` parameter.  

`bibliography-file`: File path to your bibliography file. See [bibliography documentation](https://typst.app/docs/reference/meta/bibliography/) for more information.  


`bibliography-style`: Bibliography / citation style for your thesis. See [bibliography documentation](https://typst.app/docs/reference/meta/bibliography/#parameters--style) for supported styles.  

**Don't forget to add `doc` at the end of the parameter list, as seen in `main.typ`.**
