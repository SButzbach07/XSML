# XSML
A more human-readable web alternative to HTML.

## What is XSML?
XSML stands for XML Site Markup Language. XSML was based off of HTML (Hyper Text Markup Language) and written in XML. It is a more human-readable alternative to HTML. This project is potentially the start of interactive, client-side, XML-based sites.

## Where to start?
All you need to do is download an official release from this repository. Once extracted, make sure the folder you want to host your XML files in has xsml.xsl and xsml.xsd. In your XML file, add the following tags:

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <?xml-stylesheet type="text/xsl" href="/xsml.xsl"?>
    <xsml title="Document Title Here" language="Language Code Here" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="/xsml/xsd"></xsml>
```

This is a lot for 3 lines of code, but we'll break it down.

* `<?xml version="1.0" encoding="UTF-8"?>`: This tag declares the file to be an XML document. It sets the XML version and the character set to use.
* `<?xml-stylesheet type="text/xsl" href="/xsml.xsl"?>`: This tag references _xsml.xsl_ to the document for XML transformation.
* `<xsml title="..." language="..." xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="/xsml.xsd"></xsml>`: This tag sets the root element for XSML.
    * The `title` attribute sets the document title when displayed.
    * The `language` attribute sets the language code for the document. Just as a note, the `language` attribute does not change the language displayed from output.
    * The `xmlns:xsi` attribute sets the namespace for the `xsi` prefix. This is required to load `xsml.xsd` to validate your file. It's recommended to set the attribute to _http://www.w3.org/2001/XMLSchema-instance_.
    * The `xsi:noNamespaceSchemaLocation` attribute references _xsml.xsd_ to the document for validation. `noNamespaceSchemaLocation` does not require a namespace to find the schema file, but you do need the namespace to use the `noNamespaceSchemaLocation` attribute.

Like HTML, XSML has elements to choose from. Here is a list of all that can be used.

## XSML ELements
|Element|Definition|Content|Attributes|
|:-:|-|-|-|
|`<audio source="filename" type="mime-type" />`|Defines an audio object|No content|<li>`source`: References an audio file from a local or remote server</li><li>`type`: The MIME type of the referenced file. See table below for available MIME types|
|`<bold>Text Content</bold>`|Defines bolded text|Text only|No attributes|
|`<break type="break-type" />`|Defines a line or block break|No content|`type`: The type of break of the element. Acceptable values: `block`, `inline`|
|`<button action="JavaScript-code">Text Content</button>`|Defines a clickable button|Text only|`action`: The JavaScript code to execute upon button click|
|`<cell type="text-type">Text Content</cell>`|Defines a cell in a table|Text only|`type`: Sets the type of text format. Acceptable values: `header`, `normal`|
|`<embed source="filename" />`|Defines an interactive object|No content|`source`: References an interactive file from a local or remote server|
|`<header level="header-level">Text Content</header>`|Defines a header|Text only|`level`: Sets the size of the header. Acceptable values: 1-6|
|`<highlight>Text Content</highlight>`|Defines highlighted text|Text only|No attributes|
|`<hyperlink location="filename">Text Content</hyperlink>`|Defines a link to another webpage|Text only|`location`: References a webpage from a local or remote server|
|`<image source="filename" alttext="Text Content" />`|Defines an image|No Content|<li>`source`: References an image from a local or remote server</li><li>`alt-text`: Displays text if the image fails to load</li>|
|`<italic>Text Content</italic>`|Defines italicized text|Text only|No attributes|
|`<item>Text Content</item>`|Defines a list item|Text only|No attributes|
|`<list type="list-type">Element Content</list>`|Defines a list|Elements allowed: `<item>`|`type`: Sets the type of list. Acceptable values: `ordered`, `unordered`|
|`<quote type="quote-type">Text Content</quote>`|Defines a quote|Text only|`type`: Sets the type of quote. Acceptable values: `block`, `inline`|
|`<row>Element Content</row>`|Defines a row in a table|Elements allowed: `<cell>`|No attributes|
|`<strikethrough>Text Content</strikethrough>`|Defines striked out text|Text only|No attributes|
|`<subscript>Text Content</subscript>`|Defines subscripted text|Text only|No attributes|
|`<superscript>Text Content</superscript>`|Defines superscripted text|Text only|No attributes|
|`<table>Element Content</table>`|Defines a table|Elements allowed: `<row>`|No attributes|
|`<text>Text Content</text>`|Defines normal text|Text only|No attributes|
|`<underline>Text Content</underline>`|Defines underlined text|Text only|No attributes|
|`<video source="filename" type="mime-type" />`|Defines a video object|No content|<li>`source`: References a video file from a local or remote server</li><li>`type`: The MIME type of the referenced file. See table below for available MIME types</li>|
|`<webframe source="filename" />`|Defines an external webpage frame|No content|`location`: References a webpage to display|

### MIME Types (Full web support) (applies to `<audio>` and `<video>` only)
|File extension|File type|MIME type|
|-|-|-|
|.mp3|Audio|audio/mpeg|
|.wav|Audio|audio/wav|
|.ogg|Audio/Video|audio/ogg<br>video/ogg|
|.mp4|Video|video/mp4|
|.webm|Video|video/webm|

### Target Values (applies to `<link>` only)
* `_blank`: Opens in a new tab/window
* `_parent`: Opens in the  parent frame
* `_self`: Opens in the same tab/window
* `_top`: Opens in the full body of the window

## Update Log
* May 28, 2022: The XSML 1.0 Pre-release is now available on GitHub! View the release [here](https://github.com/SButzbach07/XSML/releases/tag/Pre-release). Make sure to stop by the discussion board to give ideas, suggestions, and feeling about this ongoing project.
