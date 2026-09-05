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

#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  numbering: none,
)

#set text(
  font: "Libertinus Serif",
  size: 10.5pt,
  lang: "en",
)

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

#align(center)[
  #text(size: 24pt, weight: "bold")[✈️ Travel Checklist]
  #v(4pt)
  #text(size: 10pt, fill: rgb("666666"))[
    Check off items as you pack.
  ]
]

#v(12pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 24pt,
  [
    #category("Documents")[
      #check_item("Passport / ID", "doc_passport")
      #check_item("Visa (if required)", "doc_visa")
      #check_item("Boarding passes", "doc_boarding")
      #check_item("Travel insurance", "doc_insurance")
      #check_item("Hotel confirmations", "doc_hotel")
      #check_item("Emergency contacts", "doc_emergency")
      #check_item("Copies of documents", "doc_copies")
    ]

    #category("Money")[
      #check_item("Wallet / Cards", "money_wallet")
      #check_item("Local currency / Cash", "money_cash")
      #check_item("Notify bank of travel", "money_bank")
      #check_item("Travel credit card", "money_card")
    ]

    #category("Electronics")[
      #check_item("Phone + charger", "elec_phone")
      #check_item("Power adapter", "elec_adapter")
      #check_item("Power bank", "elec_powerbank")
      #check_item("Headphones", "elec_headphones")
      #check_item("Laptop / tablet", "elec_laptop")
      #check_item("E-reader", "elec_ereader")
      #check_item("Camera + memory cards", "elec_camera")
    ]

    #category("Clothing")[
      #check_item("Weather-appropriate outfits", "cloth_outfits")
      #check_item("Comfortable walking shoes", "cloth_shoes")
      #check_item("Bandaids for ankles", "bandaids_rolls")
      #check_item("Sleepwear", "cloth_sleep")
      #check_item("Underwear / socks", "cloth_under")
      #check_item("Swimwear (if needed)", "cloth_swim")
      #check_item("Light jacket / layers", "cloth_jacket")
      #check_item("Hat / sunglasses", "cloth_hat")
      #check_item("Bags for dirty clothes", "dirty_clothes")
    ]
  ],
  [
    #category("Toiletries")[
      #check_item("Toothbrush / toothpaste", "tooth_brush")
      #check_item("Deodorant", "tooth_deo")
      #check_item("Shampoo / conditioner", "tooth_shampoo")
      #check_item("Skincare", "tooth_skin")
      #check_item("Sunscreen", "tooth_sun")
      #check_item("Personal medications", "tooth_meds")
      #check_item("First aid kit", "tooth_firstaid")
      #check_item("Razor / grooming", "tooth_razor")
    ]

    #category("Carry-On Essentials")[
      #check_item("Water bottle (empty)", "carry_water")
      #check_item("Snacks", "carry_snacks")
      #check_item("Neck pillow / eye mask", "carry_pillow")
      #check_item("Entertainment", "carry_entertain")
      #check_item("Pen (customs forms)", "carry_pen")
      #check_item("Tissues / wet wipes", "carry_wipes")
      #check_item("Change of clothes", "carry_change")
    ]

    #category("Before Leaving")[
      #check_item("Lock doors / windows", "leave_lock")
      #check_item("Unplug appliances", "leave_unplug")
      #check_item("Set thermostat", "leave_thermo")
      #check_item("Hold mail / deliveries", "leave_mail")
      #check_item("Water plants", "leave_plants")
      #check_item("Set out-of-office email", "leave_ooo")
      #check_item("Charge all devices", "leave_charge")
    ]
  ]
)

#category("Camping")[
  #check_item("Tent / tarp / hammock", "camp_tent")
  #check_item("Sleeping bag + pad", "camp_sleep")
  #check_item("Camping stove + fuel", "camp_stove")
  #check_item("Cookware + utensils", "camp_cook")
  #check_item("Headlamp / flashlight + batteries", "camp_light")
  #check_item("Multi-tool / knife", "camp_tool")
  #check_item("Extension cord", "camp_cord")
  #check_item("Portable charger / power station", "camp_power")
  #check_item("Insect repellent", "camp_bug")
  #check_item("Fire starter / matches (waterproof)", "camp_fire")
  #check_item("Rope / paracord", "camp_rope")
  #check_item("Trash bags (pack it out)", "camp_trash")
]

#v(1fr)
#align(center)[
  #text(size: 8pt, fill: rgb("999999"))[
    Generated with Typst
  ]
]
