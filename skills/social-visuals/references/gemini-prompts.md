# Gemini prompt templates

Fill bracketed fields from the approved brief. Output each prompt as a
plain fenced code block (no language tag) so Ali can paste it into Gemini
unchanged.

Always 1080×1350 unless the mode is `html` (that path is a screenshot, not Gemini).

## Whiteboard infographic

```
Generate a single image of a physical, hand-drawn infographic on a large whiteboard or notebook page.

Crucial Style Instructions (Read First):
Medium: The image must look like a photograph of a real whiteboard or large paper notepad.
Texture: All elements must look created by hand using colored marker pens (black, blue, red, green) and highlighters (yellow/orange). Lines should be slightly imperfect, wobbly, and have the texture of ink on a surface.
No Digital Fonts: All text, headings, and bullet points must appear handwritten or hand-printed in marker pen.

Layout: Structure the 1080x1350 image as follows:

TITLE (large, bold marker, top of page):
[title]

CONTENT (hand-drawn sections with marker pen):
[3 to 7 key points, each as a short handwritten line with a bullet, number, or small drawn icon]

[If there are stats, draw them large with a circle or box around them]

Use multi-colored markers for emphasis. Keep text large and legible. Make everything look hand-drawn with slight imperfections. Make it look like a photograph of an actual notebook page.

Always include the handwritten text "Ali Elsayed Salem" at the bottom of the image, in the same hand-drawn marker style. No logos, no watermarks, no "repost" ask unless the brief explicitly includes one.
```

## Branded infographic

```
Generate a professional infographic image at 1080x1350 pixels.

Style: Clean, modern, editorial. Flat design with sharp edges and strong typography. No 3D effects, no gradients, no stock photos.

Colour palette:
- Background: [primary hex, default #0F172A]
- Text: [text hex, default #F8FAFC]
- Accent: [accent hex, default #38BDF8]

Layout:
HEADLINE (top, large bold text):
[title]

BODY (structured sections, each with an icon or number):
[3 to 6 key points as short lines, each with a numbered circle or simple icon]

[If there are stats, display them as large feature numbers with a label underneath]

FOOTER:
Ali Elsayed Salem

Keep text large and scannable. Maximum 40 words on the entire image. No decorative borders. No watermarks. No logos.
```

## Carousel slide (repeat per slide)

Keep brand hexes identical across the set.

```
Act as an expert graphic designer. Create a LinkedIn carousel slide at 1080x1350 pixels (4:5 aspect ratio).

Brand style:
- Primary colour: [hex]
- Secondary colour: [hex]
- Accent colour: [hex]
- Typography: bold geometric headline font, clean sans body font
- Aesthetic: modern, authoritative, high contrast, no stock photos

Slide [N of M]: [cover | body | takeaway]

Content:
- Headline: "[headline]"
- Body: "[body, max 15 words]"
- Visual element: [specific icon, diagram, or colour-block note]

Layout instructions:
- [headline placement and size]
- [body placement]
- [visual placement]
- [background treatment]

Constraints:
- Vertical 4:5 at exactly 1080x1350 pixels
- No watermarks, no logos
- Maintain visual consistency with the other slides in this set
```

## Quote image

```
Create a vertical quote graphic at exactly 1080 x 1350 pixels (4:5).

Quote (render exactly, including punctuation):
"[CHOSEN QUOTE]"

Style: [notebook / hand-drawn on cream | minimalist editorial with large type and white space | bold poster, heavy sans, solid colour block]

Colour palette:
- Background: [hex]
- Text: [hex]
- Accent: [hex]

Critical constraints:
- The quote is the focal point, centred, fully legible on a phone
- Under 15 words on the image besides an optional one-line footer
- Attribute nothing (no names, no handles, no logos) unless the brief says to sign "Ali Elsayed Salem"
- No motivational poster cliches, no sparkles, no stock photos of people
- Perfectly spelled, punctuation exactly as written above
```
