devices = BtDevice.create([
                         { name: 'F2i(Pill Bottle Cell)'},
                         { name: 'F2'},
                         { name: 'F3'},
                         { name: 'PT200'},
                         { name: 'SLM(2)'},
                         { name: 'Mini MT(new)'},
                         { name: 'AT4000'},
                         { name: 'ILC1500'}
                        ])

batteries = BtBattery.create([
                            { name: 'F2i(Pill Bottle Cell) Internal',
                              device_id: BtDevice.find_by_name('F2i(Pill Bottle Cell)').id,
                              capacity:  1.7
                            },
                            { name: 'F2 4Ah',
                              device_id: BtDevice.find_by_name('F2').id,
                              capacity:  4
                            },
                            { name: 'F2 10Ah',
                              device_id: BtDevice.find_by_name('F2').id,
                              capacity:  10
                            },
                            { name: 'F2 20Ah',
                              device_id: BtDevice.find_by_name('F2').id,
                              capacity:  20
                            },
                            { name: 'F3 Internal',
                              device_id: BtDevice.find_by_name('F3').id,
                              capacity:  1.49
                            },
                            { name: 'F3 4Ah',
                              device_id: BtDevice.find_by_name('F3').id,
                              capacity:  5.49
                            },
                            { name: 'F3 10Ah',
                              device_id: BtDevice.find_by_name('F3').id,
                              capacity:  11.49
                            },
                            { name: 'F3 20Ah',
                              device_id: BtDevice.find_by_name('F3').id,
                              capacity:  21.49
                            },
                            { name: 'PT200 4Ah',
                              device_id: BtDevice.find_by_name('PT200').id,
                              capacity:  4
                            },
                            { name: 'PT200 10Ah',
                              device_id: BtDevice.find_by_name('PT200').id,
                              capacity:  10
                            },
                            { name: 'PT200 20Ah',
                             device_id: BtDevice.find_by_name('PT200').id,
                              capacity:  20
                            },
                            { name: 'SLM(2) Internal',
                              device_id: BtDevice.find_by_name('SLM(2)').id,
                              capacity:  10
                            },
                            { name: 'Mini MT(new) 4Ah',
                              device_id: BtDevice.find_by_name('Mini MT(new)').id,
                              capacity:  4
                            },
                            { name: 'Mini MT(new) 10Ah',
                              device_id: BtDevice.find_by_name('Mini MT(new)').id,
                              capacity:  10
                            },
                            { name: 'Mini MT(new) 20Ah',
                              device_id: BtDevice.find_by_name('Mini MT(new)').id,
                              capacity:  20
                            },
                            { name: 'AT4000 Internal',
                              device_id: BtDevice.find_by_name('AT4000').id,
                              capacity:  4.2
                            },
                            { name: 'ILC1500 Internal',
                              device_id: BtDevice.find_by_name('ILC1500').id,
                              capacity:  1.88
                            },
                            { name: 'ILC1500 4Ah',
                              device_id: BtDevice.find_by_name('ILC1500').id,
                              capacity:  4
                            },
                            { name: 'ILC1500 10Ah',
                              device_id: BtDevice.find_by_name('ILC1500').id,
                              capacity:  10
                            },
                            { name: 'ILC1500 20Ah',
                              device_id: BtDevice.find_by_name('ILC1500').id,
                              capacity:  20
                            }

                           ])

device_states = BtDeviceState.create([
                                    {
                                      device_id: BtDevice.find_by_name("F2i(Pill Bottle Cell)").id,
                                      state: "Idle Current",
                                      current_draw: 0.0036
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2i(Pill Bottle Cell)").id,
                                      state: "Report Current",
                                      current_draw: 0.11678
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2i(Pill Bottle Cell)").id,
                                      state: "Report Time",
                                      current_draw: 73
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2i(Pill Bottle Cell)").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.000048
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2i(Pill Bottle Cell)").id,
                                      state: "Hib. Report Current",
                                      current_draw: 0.07997
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2i(Pill Bottle Cell)").id,
                                      state: "Hib. Report Time",
                                      current_draw: 101
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2i(Pill Bottle Cell)").id,
                                      state: "Hi Rate Report Current",
                                      current_draw: 0.143
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2").id,
                                      state: "Idle Current",
                                      current_draw: 0.0036
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2").id,
                                      state: "Report Current",
                                      current_draw: 0.11678
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2").id,
                                      state: "Report Time",
                                      current_draw: 73
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.000048
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2").id,
                                      state: "Hib. Report Current",
                                      current_draw: 0.07997
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2").id,
                                      state: "Hib. Report Time",
                                      current_draw: 101
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F2").id,
                                      state: "Hi Rate Report Current",
                                      current_draw: 0.143
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F3").id,
                                      state: "Idle Current",
                                      current_draw: 0.00409
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F3").id,
                                      state: "Report Current",
                                      current_draw: 0.18356
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F3").id,
                                      state: "Report Time",
                                      current_draw: 78
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F3").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.000332
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F3").id,
                                      state: "Hib. Report Current",
                                      current_draw: 0.11796
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F3").id,
                                      state: "Hib. Report Time",
                                      current_draw: 110
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("F3").id,
                                      state: "Hi Rate Report Current",
                                      current_draw: 0.213
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("PT200").id,
                                      state: "Idle Current",
                                      current_draw: 0.00574
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("PT200").id,
                                      state: "Report Current",
                                      current_draw: 0.10086
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("PT200").id,
                                      state: "Report Time",
                                      current_draw: 94
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("SLM(2)").id,
                                      state: "Idle Current",
                                      current_draw: 0.01746
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("SLM(2)").id,
                                      state: "Report Current",
                                      current_draw: 0.05248
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("SLM(2)").id,
                                      state: "Report Time",
                                      current_draw: 136
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("Mini MT(new)").id,
                                      state: "Idle Current",
                                      current_draw: 0.10152
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("Mini MT(new)").id,
                                      state: "Report Current",
                                      current_draw: 0.15733
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("Mini MT(new)").id,
                                      state: "Report Time",
                                      current_draw: 19
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("Mini MT(new)").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.000301
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("AT4000").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.000222
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("AT4000").id,
                                      state: "Hib. Report Current",
                                      current_draw: 0.06465
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("AT4000").id,
                                      state: "Hib. Report Time",
                                      current_draw: 125
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("ILC1500").id,
                                      state: "Idle Current",
                                      current_draw: 0.05976
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("ILC1500").id,
                                      state: "Report Current",
                                      current_draw: 0.16432
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("ILC1500").id,
                                      state: "Report Time",
                                      current_draw: 31
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("ILC1500").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.000716
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("ILC1500").id,
                                      state: "Hib. Report Current",
                                      current_draw: 0.07881
                                    },
                                    {
                                      device_id: BtDevice.find_by_name("ILC1500").id,
                                      state: "Hib. Report Time",
                                      current_draw: 112
                                    }
                                   ])
