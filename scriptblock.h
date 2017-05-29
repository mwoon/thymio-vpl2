#ifndef SCRIPTBLOCK_H
#define SCRIPTBLOCK_H

#include <string>
#include <list>

class ScriptBlock
{
public:
    ScriptBlock();
    ScriptBlock(std::string t, std::list<std::string> c) : type(t), content(c) { }



    //the type of the block exercise / story
    //maybe enum for this later
    std::string type;

    //The content of the block, for exercises,
    //it contains a list of the exercise codes contained in the block,
    //for story blocks, the strings are the story segments
    std::list<std::string> content;

};

#endif // SCRIPTBLOCK_H
