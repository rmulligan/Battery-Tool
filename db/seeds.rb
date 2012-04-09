devices = Device.create([
                         { name: 'F2i'},
                         { name: 'F2x'},
                         { name: 'F3'},
                         { name: 'F5'},
                         { name: 'PT200'},
                         { name: 'SLM'},
                         { name: 'Mini MT'},
                         { name: 'AT4000'},
                         { name: 'ILC1500'}
                        ])

batteries = Battery.create([{ name: 'F2i Internal',
                              device_id: Device.find_by_name('F2i').id,
                              capacity:  1.58
                            },
                            { name: 'F2x 4Ah',
                              device_id: Device.find_by_name('F2x').id,
                              capacity:  4
                            },
                            { name: 'F2x 10Ah',
                              device_id: Device.find_by_name('F2x').id,
                              capacity:  10
                            },
                            { name: 'F2x 10Ah',
                              device_id: Device.find_by_name('F2x').id,
                              capacity:  20
                            },
                            { name: 'F3 Internal',
                              device_id: Device.find_by_name('F3').id,
                              capacity:  1.43
                            },
                            { name: 'F3 4Ah',
                              device_id: Device.find_by_name('F3').id,
                              capacity:  5.43
                            },
                            { name: 'F3 10Ah',
                              device_id: Device.find_by_name('F3').id,
                              capacity:  11.43
                            },
                            { name: 'F3 20Ah',
                              device_id: Device.find_by_name('F3').id,
                              capacity:  21.43
                            },
                            { name: 'F5 Internal',
                              device_id: Device.find_by_name('F5').id,
                              capacity:  1.43
                            },
                            { name: 'F5 4Ah',
                              device_id: Device.find_by_name('F5').id,
                              capacity:  5.43
                            },
                            { name: 'F5 10Ah',
                              device_id: Device.find_by_name('F5').id,
                              capacity:  11.43
                            },
                            { name: 'F5 20Ah',
                              device_id: Device.find_by_name('F5').id,
                              capacity:  21.43
                            },
                            { name: 'PT200 4Ah',
                              device_id: Device.find_by_name('PT200').id,
                              capacity:  4
                            },
                            { name: 'PT200 10Ah',
                              device_id: Device.find_by_name('PT200').id,
                              capacity:  10
                            },
                            { name: 'PT200 20Ah',
                              device_id: Device.find_by_name('PT200').id,
                              capacity:  20
                            },
                            { name: 'SLM Internal',
                              device_id: Device.find_by_name('SLM').id,
                              capacity:  10
                            },
                            { name: 'Mini MT 4Ah',
                              device_id: Device.find_by_name('Mini MT').id,
                              capacity:  4
                            },
                            { name: 'Mini MT 10Ah',
                              device_id: Device.find_by_name('Mini MT').id,
                              capacity:  10
                            },
                            { name: 'Mini MT 20Ah',
                              device_id: Device.find_by_name('Mini MT').id,
                              capacity:  20
                            },
                            { name: 'AT4000 Internal',
                              device_id: Device.find_by_name('AT4000').id,
                              capacity:  4.2
                            },
                            { name: 'ILC1500 Internal',
                              device_id: Device.find_by_name('ILC1500').id,
                              capacity:  1.88
                            },
                            { name: 'ILC1500 4Ah',
                              device_id: Device.find_by_name('ILC1500').id,
                              capacity:  4
                            },
                            { name: 'ILC1500 10Ah',
                              device_id: Device.find_by_name('ILC1500').id,
                              capacity:  10
                            },
                            { name: 'ILC1500 20Ah',
                              device_id: Device.find_by_name('ILC1500').id,
                              capacity:  20
                            }

                           ])

device_states = DeviceState.create([
                                    {
                                      device_id: Device.find_by_name("F2i").id,
                                      state: "Idle Current",
                                      current_draw: 3.6
                                    },
                                    {
                                      device_id: Device.find_by_name("F2i").id,
                                      state: "Report Current",
                                      current_draw: 116.78
                                    },
                                    {
                                      device_id: Device.find_by_name("F2i").id,
                                      state: "Report Time",
                                      current_draw: 73
                                    },
                                    {
                                      device_id: Device.find_by_name("F2i").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.048
                                    },
                                    {
                                      device_id: Device.find_by_name("F2i").id,
                                      state: "Hib. Report Current",
                                      current_draw: 79.97
                                    },
                                    {
                                      device_id: Device.find_by_name("F2i").id,
                                      state: "Hib. Report Time",
                                      current_draw: 101
                                    },
                                    {
                                      device_id: Device.find_by_name("F2x").id,
                                      state: "Idle Current",
                                      current_draw: 3.6
                                    },
                                    {
                                      device_id: Device.find_by_name("F2x").id,
                                      state: "Report Current",
                                      current_draw: 116.78
                                    },
                                    {
                                      device_id: Device.find_by_name("F2x").id,
                                      state: "Report Time",
                                      current_draw: 73
                                    },
                                    {
                                      device_id: Device.find_by_name("F2x").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.048
                                    },
                                    {
                                      device_id: Device.find_by_name("F2x").id,
                                      state: "Hib. Report Current",
                                      current_draw: 79.97
                                    },
                                    {
                                      device_id: Device.find_by_name("F2x").id,
                                      state: "Hib. Report Time",
                                      current_draw: 101
                                    },
                                    {
                                      device_id: Device.find_by_name("F3").id,
                                      state: "Idle Current",
                                      current_draw: 4.09
                                    },
                                    {
                                      device_id: Device.find_by_name("F3").id,
                                      state: "Report Current",
                                      current_draw: 183.56
                                    },
                                    {
                                      device_id: Device.find_by_name("F3").id,
                                      state: "Report Time",
                                      current_draw: 78
                                    },
                                    {
                                      device_id: Device.find_by_name("F3").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.332
                                    },
                                    {
                                      device_id: Device.find_by_name("F3").id,
                                      state: "Hib. Report Current",
                                      current_draw: 117.96
                                    },
                                    {
                                      device_id: Device.find_by_name("F3").id,
                                      state: "Hib. Report Time",
                                      current_draw: 110
                                    },
                                    {
                                      device_id: Device.find_by_name("PT200").id,
                                      state: "Idle Current",
                                      current_draw: 5.74
                                    },
                                    {
                                      device_id: Device.find_by_name("PT200").id,
                                      state: "Report Current",
                                      current_draw: 100.86
                                    },
                                    {
                                      device_id: Device.find_by_name("PT200").id,
                                      state: "Report Time",
                                      current_draw: 94
                                    },
                                    {
                                      device_id: Device.find_by_name("SLM").id,
                                      state: "Idle Current",
                                      current_draw: 17.46
                                    },
                                    {
                                      device_id: Device.find_by_name("SLM").id,
                                      state: "Report Current",
                                      current_draw: 52.48
                                    },
                                    {
                                      device_id: Device.find_by_name("SLM").id,
                                      state: "Report Time",
                                      current_draw: 136
                                    },
                                    {
                                      device_id: Device.find_by_name("Mini MT").id,
                                      state: "Idle Current",
                                      current_draw: 101.52
                                    },
                                    {
                                      device_id: Device.find_by_name("Mini MT").id,
                                      state: "Report Current",
                                      current_draw: 157.33
                                    },
                                    {
                                      device_id: Device.find_by_name("Mini MT").id,
                                      state: "Report Time",
                                      current_draw: 19
                                    },
                                    {
                                      device_id: Device.find_by_name("AT4000").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.222
                                    },
                                    {
                                      device_id: Device.find_by_name("AT4000").id,
                                      state: "Hib. Report Current",
                                      current_draw: 64.65
                                    },
                                    {
                                      device_id: Device.find_by_name("AT4000").id,
                                      state: "Hib. Report Time",
                                      current_draw: 125
                                    },
                                    {
                                      device_id: Device.find_by_name("ILC1500").id,
                                      state: "Idle Current",
                                      current_draw: 59.76
                                    },
                                    {
                                      device_id: Device.find_by_name("ILC1500").id,
                                      state: "Report Current",
                                      current_draw: 164.32
                                    },
                                    {
                                      device_id: Device.find_by_name("ILC1500").id,
                                      state: "Report Time",
                                      current_draw: 31
                                    },
                                    {
                                      device_id: Device.find_by_name("ILC1500").id,
                                      state: "Hib. Idle Current",
                                      current_draw: 0.716
                                    },
                                    {
                                      device_id: Device.find_by_name("ILC1500").id,
                                      state: "Hib. Report Current",
                                      current_draw: 78.81
                                    },
                                    {
                                      device_id: Device.find_by_name("ILC1500").id,
                                      state: "Hib. Report Time",
                                      current_draw: 112
                                    }
                                   ])
