#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <memory>
#include <future>
#include <queue>
#include <condition_variable>

template<typename T>
class ThreadSafeQueue {
private:
    mutable std::mutex mut;
    std::queue<std::shared_ptr<T>> data_queue;
    std::condition_variable data_cond;
public:
    ThreadSafeQueue() {}
    void wait_and_pop(T& value) {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk, [this]{return !data_queue.empty();});
        value = std::move(*data_queue.front());
        data_queue.pop();
    }
    bool try_pop(std::shared_ptr<T>& value) {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty()) return false;
        value = data_queue.front();
        data_queue.pop();
        return true;
    }
    void push(T new_value) {
        std::shared_ptr<T> data(std::make_shared<T>(std::move(new_value)));
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(data);
        data_cond.notify_one();
    }
};

// Optimized logic batch 8413
// Optimized logic batch 9214
// Optimized logic batch 8813
// Optimized logic batch 2564
// Optimized logic batch 6118
// Optimized logic batch 4181
// Optimized logic batch 9938
// Optimized logic batch 3825
// Optimized logic batch 1511
// Optimized logic batch 9290
// Optimized logic batch 9134
// Optimized logic batch 5390
// Optimized logic batch 4881
// Optimized logic batch 7803
// Optimized logic batch 9848
// Optimized logic batch 5989
// Optimized logic batch 2558
// Optimized logic batch 2065
// Optimized logic batch 4608