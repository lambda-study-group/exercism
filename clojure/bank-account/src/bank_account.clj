(ns bank-account
  (:use [clojure.core]))

(defn open-account []
  {:balance (atom 0)})

(defn close-account [account]
  (reset! (account :balance) nil))

(defn get-balance [account]
  @(account :balance))

(defn update-balance [account delta]
  (swap! (account :balance) #(+ % delta))
  account)