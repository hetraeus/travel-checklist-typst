// main.typ
// Imports the translations and uses the language from the command line.

#import "translations.typ": translations

// Determine language (default to English if not provided)
#let lang = sys.inputs.at("lang", default: "en")

// Helper to get the current translation for a key
#let t(key) = {
  translations.at(lang).at(key)
}

// ----------------------------------------------------------------------
// Page and text settings (unchanged)
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  numbering: none,
)

#set text(
  font: "Libertinus Serif",
  size: 10.5pt,
  lang: "en",  // keep it as "en" – the UI strings are already translated
)

// ----------------------------------------------------------------------
// Helper functions (identical to original)

#let capture_field(field_name: "", field_type: "text", content) = {
  box({
    context {
      let pos = here().position()
      let size = measure(content)
      metadata((
        fieldName: field_name,
        fieldType: field_type,
        dimensions: (width: size.width, height: size.height),
        pos: (page: pos.page, x: pos.x, y: pos.y),
      ))
    }
    content
  })
}

#let check_item(name, id) = [
  #capture_field(
    field_name: id,
    field_type: "checkbox",
  )[
    #box(width: 10pt, height: 10pt, stroke: 0.5pt + rgb("1a1a1a"), radius: 2pt)
  ]
  #h(6pt)
  #name
  #v(4pt)
]

#let category(title, items) = [
  #block(breakable: false)[
    === #text(weight: "bold", size: 11pt)[#title]
    #v(-2pt)
    #line(length: 100%, stroke: 0.5pt + rgb("cccccc"))
    #v(2pt)
    #items
    #v(8pt)
  ]
]

// ----------------------------------------------------------------------
// Document content – all strings are replaced with #t(...)

#align(center)[
  #text(size: 24pt, weight: "bold")[#t("title")]
  #v(4pt)
  #text(size: 10pt, fill: rgb("666666"))[#t("subtitle")]
]

#v(12pt)

// Two‑column layout
#grid(
  columns: (1fr, 1fr),
  gutter: 24pt,
  [
    #category(t("categories").documents)[
      #check_item(t("items").doc_passport, "doc_passport")
      #check_item(t("items").doc_visa, "doc_visa")
      #check_item(t("items").doc_boarding, "doc_boarding")
      #check_item(t("items").doc_insurance, "doc_insurance")
      #check_item(t("items").doc_hotel, "doc_hotel")
      #check_item(t("items").doc_emergency, "doc_emergency")
      #check_item(t("items").doc_copies, "doc_copies")
    ]

    #category(t("categories").money)[
      #check_item(t("items").money_wallet, "money_wallet")
      #check_item(t("items").money_cash, "money_cash")
      #check_item(t("items").money_bank, "money_bank")
      #check_item(t("items").money_card, "money_card")
    ]

    #category(t("categories").electronics)[
      #check_item(t("items").elec_phone, "elec_phone")
      #check_item(t("items").elec_adapter, "elec_adapter")
      #check_item(t("items").elec_powerbank, "elec_powerbank")
      #check_item(t("items").elec_headphones, "elec_headphones")
      #check_item(t("items").elec_laptop, "elec_laptop")
      #check_item(t("items").elec_ereader, "elec_ereader")
      #check_item(t("items").elec_camera, "elec_camera")
    ]

    #category(t("categories").clothing)[
      #check_item(t("items").cloth_outfits, "cloth_outfits")
      #check_item(t("items").cloth_shoes, "cloth_shoes")
      #check_item(t("items").bandaids_rolls, "bandaids_rolls")
      #check_item(t("items").cloth_sleep, "cloth_sleep")
      #check_item(t("items").cloth_under, "cloth_under")
      #check_item(t("items").cloth_swim, "cloth_swim")
      #check_item(t("items").cloth_jacket, "cloth_jacket")
      #check_item(t("items").cloth_hat, "cloth_hat")
      #check_item(t("items").dirty_clothes, "dirty_clothes")
    ]
  ],
  [
    #category(t("categories").toiletries)[
      #check_item(t("items").tooth_brush, "tooth_brush")
      #check_item(t("items").tooth_deo, "tooth_deo")
      #check_item(t("items").tooth_shampoo, "tooth_shampoo")
      #check_item(t("items").tooth_skin, "tooth_skin")
      #check_item(t("items").tooth_sun, "tooth_sun")
      #check_item(t("items").tooth_meds, "tooth_meds")
      #check_item(t("items").tooth_firstaid, "tooth_firstaid")
      #check_item(t("items").tooth_razor, "tooth_razor")
    ]

    #category(t("categories").carryon)[
      #check_item(t("items").carry_water, "carry_water")
      #check_item(t("items").carry_snacks, "carry_snacks")
      #check_item(t("items").carry_pillow, "carry_pillow")
      #check_item(t("items").carry_entertain, "carry_entertain")
      #check_item(t("items").carry_pen, "carry_pen")
      #check_item(t("items").carry_wipes, "carry_wipes")
      #check_item(t("items").carry_change, "carry_change")
    ]

    #category(t("categories").before)[
      #check_item(t("items").leave_lock, "leave_lock")
      #check_item(t("items").leave_unplug, "leave_unplug")
      #check_item(t("items").leave_thermo, "leave_thermo")
      #check_item(t("items").leave_mail, "leave_mail")
      #check_item(t("items").leave_plants, "leave_plants")
      #check_item(t("items").leave_ooo, "leave_ooo")
      #check_item(t("items").leave_charge, "leave_charge")
    ]
  ]
)

// Single category spanning the full width
#category(t("categories").camping)[
  #check_item(t("items").camp_tent, "camp_tent")
  #check_item(t("items").camp_sleep, "camp_sleep")
  #check_item(t("items").camp_stove, "camp_stove")
  #check_item(t("items").camp_cook, "camp_cook")
  #check_item(t("items").camp_light, "camp_light")
  #check_item(t("items").camp_tool, "camp_tool")
  #check_item(t("items").camp_cord, "camp_cord")
  #check_item(t("items").camp_power, "camp_power")
  #check_item(t("items").camp_bug, "camp_bug")
  #check_item(t("items").camp_fire, "camp_fire")
  #check_item(t("items").camp_rope, "camp_rope")
  #check_item(t("items").camp_trash, "camp_trash")
]

#v(1fr)
#align(center)[
  #text(size: 8pt, fill: rgb("999999"))[
    Generated with Typst
  ]
]
