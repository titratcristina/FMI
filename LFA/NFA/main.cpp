#include <iostream>
#include <map>
#include <string>
#include <set>
#include <fstream>

using namespace std;

class NFA {
    set<int> Q, F;
    set<char> Sigma;
    set<int> q0;
    map<pair<int, char>, set<int>> delta;

public:
    NFA() { this->q0.insert(0); }

    NFA(set<int> Q, set<char> Sigma, map<pair<int, char>, set<int>> delta, set<int> q0, set<int> F) {
        this->Q = Q;
        this->Sigma = Sigma;
        this->delta = delta;
        this->q0 = q0;
        this->F = F;
    }

    set<int> getQ() const {
        return this->Q;
    }

    set<int> getF() const {
        return this->F;
    }

    set<char> getSigma() const {
        return this->Sigma;
    }

    set<int> getInitialState() const {
        return this->q0;
    }

    map<pair<int, char>, set<int>> getDelta() const {
        return this->delta;
    }

    friend istream &operator>>(istream &, NFA &);

    bool isFinalState(set<int>);

    set<int> deltaStar(set<int>, string);
};

bool NFA::isFinalState(set<int> q) {
    for (int i : q) {
        if (F.find(i) != F.end()) {
            return true;
        }
    }
    return false;
}

set<int> NFA::deltaStar(set<int> s, string w) {
    int n = w.length();
    set<int> localFinalStates;

    // din prima stare în care suntem
    // (pentru că suntem într-un set<int> s)
    // adăugăm în localFinalStates
    // toate tranzițiile cu prima litera din w
    for (int j : delta[{*s.begin(), w[0]}]) {
        localFinalStates.insert(j);
    }
    // am efectuat o tranziție, micșorez n-ul
    n--;

    // dacă n = 0, înseamnă că returnez stările finale adăugate
    if (n == 0) {
        return localFinalStates;
    }

    int contor = 0;

    // altfel, cât timp n!=0
    while (n) {
        set<int> auxiliar;

        // ma mut in stările finale in care am ajuns
        // efectuând o tranziție
        // adică dacă din din 0 cu a am ajuns în 1 3 4 5
        // acum iterez {1, 3, 4, 5}
        // pentru a face tranziții cu urmatoarea literă
        // și stochez starile in auxiliar
        for (int i : localFinalStates) {
            for (int j : delta[{i, w[contor + 1]}]) {
                auxiliar.insert(j);
            }
        }
        n--;
        contor++;

        // golesc set-ul de localFinalStates
        localFinalStates.clear();

        // mut din auxiliar in localFinalStates
        for (int i : auxiliar) {
            localFinalStates.insert(i);
        }
        auxiliar.clear();
    }
    return localFinalStates;
}

istream &operator>>(istream &f, NFA &M) {
    int noOfStates;
    f >> noOfStates;
    for (int i = 0; i < noOfStates; ++i) {
        int q;
        f >> q;
        M.Q.insert(q);
    }

    int noOfLetters;
    f >> noOfLetters;
    for (int i = 0; i < noOfLetters; ++i) {
        char ch;
        f >> ch;
        M.Sigma.insert(ch);
    }

    int noOfTransitions;
    f >> noOfTransitions;
    for (int i = 0; i < noOfTransitions; ++i) {
        int s, noOfTrans;
        char ch;
        f >> s >> ch >> noOfTrans;
        for (int j = 0; j < noOfTrans; ++j) {
            int x;
            f >> x;
            M.delta[{s, ch}].insert(x);
        }
    }
    int q0;
    f >> q0;
    M.q0.insert(q0);

    int noOfFinalStates;
    f >> noOfFinalStates;
    for (int i = 0; i < noOfFinalStates; ++i) {
        int q;
        f >> q;
        M.F.insert(q);
    }

    return f;
}

int main() {
    NFA M;

    ifstream fin("nfa.txt");
    fin >> M;
    fin.close();

    set<int> lastState = M.deltaStar(M.getInitialState(), "aabbb"); // cuvant acceptat
    //set<int> lastState = M.deltaStar(M.getInitialState(), "babb"); // cuvant respins

    if (M.isFinalState(lastState)) {
        cout << "Cuvant acceptat";
    } else {
        cout << "Cuvant respins";
    }

    return 0;
}

// diferenta între dfa si nfa este functia de tranzitie
// la DFA pentru fiecare aplicare a functiei delta
// se retin toate posibilitatile de stari de continuare
// iar la pasul urmator se reaplica delta

// M = (Q, Σ, δ, q0, F)

// structură date intrare:
// 5            (număr stări)
// 0 1 2 3 4    (Q - mulțimea de stări)
// 2            (număr caractere)
// a b          (Σ - alfabetul de intrare)
// 8            (număr tranziții)
// 0 a 1 1      (tranziții de forma: stareIinitiala litera nrStari stare1 stare2 ... staren)
// 0 b 2 0 3
// 1 a 1 2
// 1 b 1 4
// 2 a 1 2
// 2 b 1 2
// 3 b 1 0
// 4 a 3 0 2 3
// 0            (q0 - starea inițială)
// 1            (număr stări finale)
// 2            (F - mulțimea stărilor finale)
