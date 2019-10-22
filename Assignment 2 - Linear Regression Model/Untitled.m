%% Machine Learning Assignment 2

clear; clc;

dataset = readtable("mtcarsdata-4features.csv");

cars = dataset {:,1};

datasetMatrix = dataset {:,2:end};