#include <iostream>
#include <string>

// Relay states (0 = OFF, 1 = ON)
bool stateRelay1 = false;
bool stateRelay2 = false;
bool stateRelay3 = false;
bool stateRelay4 = false;

// Messages
const std::string promptMsg = "Enter 0 (Relay 1 OFF), 1 (Relay 1 ON), 2 (Relay 2 OFF), 3 (Relay 2 ON), 4 (Relay 3 OFF), 5 (Relay 3 ON), 6 (Relay 4 OFF), 7 (Relay 4 ON): ";
const std::string relayMsg = "Relay selected: ";
const std::string beforeStateMsg = "State before: ";
const std::string afterStateMsg = "State after: ";
const std::string relay1Msg = "Relay 1 (Light)";
const std::string relay2Msg = "Relay 2 (Fan)";
const std::string relay3Msg = "Relay 3 (Heater)";
const std::string relay4Msg = "Relay 4 (Pump)";
const std::string onMsg = "ON";
const std::string offMsg = "OFF";
const std::string newline = "\n";

void displayRelayState(const std::string& relayMsg, bool state);
void updateRelayState(bool& state, bool newState, const std::string& relayMsg);

int main() {
    char userInput;

    while (true) {
        std::cout << promptMsg;
        std::cin >> userInput;

        switch (userInput) {
            case '0':
                updateRelayState(stateRelay1, false, relay1Msg);
                break;
            case '1':
                updateRelayState(stateRelay1, true, relay1Msg);
                break;
            case '2':
                updateRelayState(stateRelay2, false, relay2Msg);
                break;
            case '3':
                updateRelayState(stateRelay2, true, relay2Msg);
                break;
            case '4':
                updateRelayState(stateRelay3, false, relay3Msg);
                break;
            case '5':
                updateRelayState(stateRelay3, true, relay3Msg);
                break;
            case '6':
                updateRelayState(stateRelay4, false, relay4Msg);
                break;
            case '7':
                updateRelayState(stateRelay4, true, relay4Msg);
                break;
            default:
                std::cout << "Invalid input, please try again." << std::endl;
                break;
        }
    }
    return 0;
}

void displayRelayState(const std::string& relayMsg, bool state) {
    std::cout << relayMsg << newline;
    std::cout << beforeStateMsg << (state ? onMsg : offMsg) << newline;
}

void updateRelayState(bool& state, bool newState, const std::string& relayMsg) {
    displayRelayState(relayMsg, state);
    state = newState;
    std::cout << afterStateMsg << (state ? onMsg : offMsg) << newline;
    std::cout << newline;
}

