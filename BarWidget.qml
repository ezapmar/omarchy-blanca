import QtQuick
import QtQuick.Effects

// Blanca's button on the bar: the dog in the bar's own text colour, a click opens the
// clippings. The list, and everything behind it, is `blanca menu`; this widget is the
// button and nothing else.
Item {
  id: root

  // Filled in by the bar when it loads the widget.
  property var bar
  property string moduleName: "io.github.ezapmar.blanca"
  property var settings

  readonly property real iconSize: 16

  implicitWidth: 28
  implicitHeight: bar ? bar.barSize : 26

  Image {
    id: icon
    anchors.centerIn: parent
    width: root.iconSize
    height: root.iconSize
    // Decoded at twice the drawn size so the silhouette stays crisp on a HiDPI screen.
    sourceSize.width: root.iconSize * 2
    sourceSize.height: root.iconSize * 2
    source: Qt.resolvedUrl("blanca-symbolic.svg")
    fillMode: Image.PreserveAspectFit
    // Kept as a hidden layer so the effect can sample it as a texture.
    visible: false
    layer.enabled: true
  }

  // Qt's SVG renderer has no currentColor, so the icon ships with a plain fill and the
  // effect paints it in whatever colour the bar is using for its own glyphs.
  MultiEffect {
    anchors.fill: icon
    source: icon
    colorization: 1.0
    colorizationColor: root.bar ? root.bar.foreground : "white"
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    onEntered: if (root.bar) root.bar.showTooltip(root, "Blanca clipboard")
    onExited: if (root.bar) root.bar.hideTooltip(root)
    onClicked: if (root.bar) root.bar.run("blanca menu")
  }
}
