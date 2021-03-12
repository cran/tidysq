//
//#include "tidysq.h"
//#include "tidysq/util/SequenceIterator.h"
//
//using namespace tidysq;
//using namespace std;
//
//#define raws vector<unsigned char>
//
//
//vector<tuple<raws, LenSq, raws>> vectors {
//        {raws{194, 132, 65, 18, 38, 76}, 16, raws{2, 0, 3, 2, 0, 3, 0, 2, 2, 2, 0, 3, 2, 0, 3, 2}},
//        {raws{200, 144, 1}, 6, raws{0, 1, 3, 0, 1, 3}},
//        {raws{73, 146, 36}, 8, raws{1, 1, 1, 1, 1, 1, 1, 1}},
//        {raws{0}, 1, raws{0}},
//        {raws{}, 0, raws{}}
//};
//
//#define gpacked(n) get<0>(vectors[n])
//#define gsize(n) get<1>(vectors[n])
//#define gunpacked(n) get<2>(vectors[n])
//
//typedef util::BasicSequenceIterator<true> ConstIter;
//typedef util::BasicSequenceIterator<false> Iter;
//
//int main() {
//    cout << "TEST 1" << endl;
//    {
//        ConstIter(gpacked(0), gsize(0), 3);
//        cout << "constructed 0" << endl;
//        ConstIter(gpacked(1), gsize(1), 3);
//        cout << "constructed 1" << endl;
//        ConstIter(gpacked(2), gsize(2), 3);
//        cout << "constructed 2" << endl;
//        ConstIter(gpacked(3), gsize(3), 3);
//        cout << "constructed 3" << endl;
//        ConstIter(gpacked(4), gsize(4), 3);
//        cout << "constructed 4" << endl;
//    }
//    cout << "destructed 0" << endl;
//
//    ConstIter iter(gpacked(0), gsize(0), 3);
//    ConstIter end(gpacked(0), gsize(0), 3, false);
//
//
//
//    while (iter < end) {
//        std::cout << static_cast<int>(*iter) << " - ";
//        iter = iter + 3;
//    }
//
//}
