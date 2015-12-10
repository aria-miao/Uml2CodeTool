#include "uClassDiagram.h"

#include <algorithm>
#include "uDebugPrinter.h"
#include "uBaseClass.h"

using namespace std;

uClassDiagram::uClassDiagram()
{

}

uClassDiagram &uClassDiagram::getInstance()
{
    static uClassDiagram mInstance;
    return mInstance;
}

void uClassDiagram::addClass(uInheritable *uClass)
{
    mClasses.push_back(uClass);
}

void uClassDiagram::removeClass(uInheritable *uClass)
{
    mClasses.erase(std::remove(mClasses.begin(), mClasses.end(), uClass), mClasses.end());
}

bool uClassDiagram::removeClass(QString const &name)
{
    for(TClassesConstIter iter = mClasses.begin(); iter < mClasses.end(); iter++){
        if ((*iter)->getName() == name.toStdString())
            mClasses.erase(std::remove(mClasses.begin(), mClasses.end(), (*iter)), mClasses.end());
            return true;
    }
    return false;
}

bool uClassDiagram::contains(uInheritable *uClass) const
{
    return std::find(mClasses.begin(), mClasses.end(), uClass) != mClasses.end();
}

uInheritable *uClassDiagram::find(QString const &name) const
{
    for(TClassesConstIter iter = mClasses.begin(); iter < mClasses.end(); iter++){
        if ((*iter)->getName() == name.toStdString())
            return (*iter);
    }
    return NULL;
}

void uClassDiagram::applyVisitor(uVisitor *visitor)
{
    if (visitor == NULL)
        uDebugPrinter::printText("NULL POINTER");

    for(TClassesIter iter = mClasses.begin(); iter < mClasses.end(); iter++){
        uDebugPrinter::printClass(*iter);
        (*iter)->accept(visitor);
    }
}

uInheritable *uClassDiagram::get(int index) const
{
    if (index >= mClasses.size()) return NULL;
    return mClasses[index];
}

int uClassDiagram::size() const
{
    return mClasses.size();
}

int uClassDiagram::getIndex(const QString &name) const
{
    for (size_t i=0; i<mClasses.size(); i++) {
        if (mClasses[i]->qGetName() == name) return i;
    }
    return -1;
}
