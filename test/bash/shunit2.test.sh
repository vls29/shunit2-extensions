#!/bin/bash

function test_assertEquals() {
    assertEquals 1 1
}

function test_assertNotEquals() {
    assertNotEquals 1 2
}

function test_assertTrue() {
    assertTrue "true"
}

function test_assertFalse() {
    assertFalse "false"
}

function test_assertNull() {
    assertNull ""
}

function test_assertNotNull() {
    assertNotNull "not null"
}

function test_assertEquals_fails_correctly() {
    (assertEquals 1 2 > /dev/null)
    local lastCommandStatus=$?
    assertEquals 1 ${lastCommandStatus}
}

function test_assertNotEquals_fails_correctly() {
    (assertNotEquals 1 1 > /dev/null)
    local lastCommandStatus=$?
    assertEquals 1 ${lastCommandStatus}
}

function test_assertTrue_fails_correctly() {
    (assertTrue "false" > /dev/null)
    local lastCommandStatus=$?
    assertEquals 1 ${lastCommandStatus}
}

function test_assertFalse_fails_correctly() {
    (assertFalse "true" > /dev/null)
    local lastCommandStatus=$?
    assertEquals 1 ${lastCommandStatus}
}

function test_assertNull_fails_correctly() {
    (assertNull "not null" > /dev/null)
    local lastCommandStatus=$?
    assertEquals 1 ${lastCommandStatus}
}

function test_assertNotNull_fails_correctly() {
    (assertNotNull "" > /dev/null)
    local lastCommandStatus=$?
    assertEquals 1 ${lastCommandStatus}
}

function deliberately_failing_test() {
    assertFalse "true"
}

. shunit2
