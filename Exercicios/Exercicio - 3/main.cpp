#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <cmath>

#define INPUT_FILE "./testeula.ula"
#define OUTPUT_FILE "./testeula.hex"

size_t lineIndex = 0;

class Variable {
    private:
        std::string name;
        int8_t value;

    public:
        Variable(std::string name, int8_t value) {
            this->name = name;
            this->value = value;
        }

        std::string getName() {
            return name;
        }

        int8_t getValue() {
            return value;
        }

        void setValue(int8_t value) {
            this->value = value;
        }
};

class Operations {
    private:
        std::vector<Variable> variables;

    public:
        static const int8_t An = 0x00;
        static const int8_t Bn = 0x01;
        static const int8_t umL = 0x02;
        static const int8_t zeroL = 0x03;
        static const int8_t nAeB = 0x04;
        static const int8_t nAoB = 0x05;
        static const int8_t AxB = 0x06;
        static const int8_t AeBn = 0x07;
        static const int8_t AnoB = 0x08;
        static const int8_t nAxB = 0x09;
        static const int8_t AoB = 0x0A;
        static const int8_t AeB = 0x0B;
        static const int8_t AneB = 0x0C;
        static const int8_t AoBn = 0x0D;
        static const int8_t copiaB = 0x0E;
        static const int8_t copiaA = 0x0F;
        static const int8_t attr = 0x10;
        static const int8_t nil = 0x11;

        char getHexValue(int8_t value) {
            if(value < 0) value *= -1;
            char hex = '\0';
            if(value < 10) hex = value + 48; 
            else if(value < 16) hex = value + 55;
            
            return hex;
        }

        int8_t recognize(std::string expression) {
            if(expression == "An") return An;
            else if(expression == "Bn") return Bn;
            else if(expression == "umL") return umL;
            else if(expression == "zeroL") return zeroL;
            else if(expression == "nAeB") return nAeB;
            else if(expression == "nAoB") return nAoB;
            else if(expression == "AxB") return AxB;
            else if(expression == "AeBn") return AeBn;
            else if(expression == "AnoB") return AnoB;
            else if(expression == "nAxB") return nAxB;
            else if(expression == "AoB") return AoB;
            else if(expression == "AeB") return AeB;
            else if(expression == "AneB") return AneB;
            else if(expression == "AoBn") return AoBn;
            else if(expression == "copiaB") return copiaB;
            else if(expression == "copiaA") return copiaA;
            else return attr;
        }

        std::string compile(int8_t opCode, std::string variable, std::string expression) {
            std::string str = "";
            size_t position = std::string::npos;
            double num = 0.0;

            switch(opCode) {
                case An:
                case Bn:
                case umL:
                case zeroL:
                case nAeB:
                case nAoB:
                case AxB:
                case AeBn:
                case AnoB:
                case nAxB:
                case AoB:
                case AeB:
                case AneB:
                case AoBn:
                case copiaB:
                case copiaA:
                    if(variables.size() < 2) {
                        std::cout << "[WARNING] Not enough variables to compile at line " << lineIndex << "." << std::endl;
                        return "";
                    }
                    
                    if(variables[0].getValue() < 0) str += "-";
                    str += getHexValue(variables[0].getValue());

                    if(variables[1].getValue() < 0) str += "-";
                    str += getHexValue(variables[1].getValue());
                    return str + getHexValue(opCode);

                case attr:
                    position = expression.find(",");
                    if(position != std::string::npos) expression.replace(position, 1, ".");

                    num = std::round(std::stof(expression));
                    std::cout << num << std::endl;
                    setVariable(variable, (int8_t)num);
            }
                    
            return str;
        }

        void setVariable(std::string variable, int8_t code) {
            bool value = false;
            for(size_t i = 0; !value && i < variables.size(); i++) {
                value = variables[i].getName() == variable;
                if(value) variables[i].setValue(code);
            }

            if(!value) variables.push_back(Variable(variable, code));
        }

        int8_t getVariable(std::string variable) {
            for(size_t i = 0; i < variables.size(); i++)
                if(variables[i].getName() == variable) 
                    return variables[i].getValue();
            
            return nil;
        }
};

std::ifstream openFile(std::string programPath) {
    std::ifstream fileStream;
    fileStream.open(programPath);
    if(!fileStream.is_open()) {
        std::cout << "File not found exception." << std::endl;
        throw 1;
    }

    fileStream.seekg(0);
    return fileStream;
}

void printToFile(std::string filePath, std::string hex) {
    if(hex.length() == 0) return;

    std::ofstream fileStream;
    fileStream.open(filePath, std::ios::app);
    fileStream << hex << std::endl;
    fileStream.close();
}

void init(std::string filePath) {
    std::ofstream stream;
    stream.open(filePath, std::ofstream::out | std::ofstream::trunc);
    stream.close();
}

void trim(std::string& str) {
    for(size_t i = 0; i < str.length(); i++)
        if(str[i] == ' ') str.erase(i--, 1);
}

int main() {
    init(OUTPUT_FILE);

    std::ifstream fileStream = openFile(INPUT_FILE);

    std::string line;
    do getline(fileStream, line); while(line != "inicio:");

    Operations operations;
    getline(fileStream, line);
    while(line != "fim.") {
        trim(line);
        if(line.length() > 0 && line[0] != ';') {
            lineIndex++;
            size_t eqpos = line.find('=');
            size_t scpos = line.find(';');

            std::string variable = line.substr(0, eqpos);
            std::string expression = line.substr(eqpos + 1, scpos - eqpos - 1);

            int8_t opCode = operations.recognize(expression);
            std::string hex = operations.compile(opCode, variable, expression);

            printToFile(OUTPUT_FILE, hex);
        }
        getline(fileStream, line);
    }

    fileStream.close();
    return 0;
}
