
# Qt

## Qt5 with Python3

### Basic Window
- Import QtWidgets to get access to GUI
- Create an application object for its event loop
- Create a Qwidget as our window
- Show our window
- Enter our loop with app.exec\_()

```python
import sys
from PyQt5 import QtWidgets

def window():
    app = QtWidgets.QApplication(sys.argv)
    w = QtWidgets.QWidget()
    w.setWindowTitle('PYQt5 lesson 1')
    w.show()
    sys.exit(app.exec_())

window()
```

### QLabel

```python
import sys
from PyQt5 import QtWidgets, QtGui

def window():
    app = QtWidgets.QApplication(sys.argv)
    w = QtWidgets.QWidget()
    l1 = QtWidgets.QLabel(w)
    l2 = QtWidgets.QLabel(w)
    l1.setText('Hello World')
    l2.setPixmap(QtGui.QPixmap('globe.png'))
    w.setWindowTitle('PyQt5 Lesson 2')
    w.setGeometry(100, 100, 300, 200)
    l1.move(100, 20)
    l2.move(120, 90)
    w.show()
    sys.exit(app.exec_())

window()
```

### QPushButton

```python
import sys
from PyQt5 import QtWidgets


def window():
    app = QtWidgets.QApplication(sys.argv)
    w = QtWidgets.QWidget()
    b = QtWidgets.QPushButton(w)
    l = QtWidgets.QLabel(w)
    b.setText('Push Me')
    l.setText('Look at Me')
    w.setWindowTitle('PyQt5 Lesson 3')
    b.move(100, 50)
    l.move(110, 100)
    w.setGeometry(100, 100, 300, 200)
    w.show()
    sys.exit(app.exec_())

window()
```



## Qt4
Most basic Python program

```python
import sys
from PyQt4 import QtGui

app = QtGui.QApplication(sys.argv)

window = QtGui.QWidget()

window.show()
```

