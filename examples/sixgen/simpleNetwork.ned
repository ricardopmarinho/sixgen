//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package inet.examples.sixgen;

import inet.node.sixgen.sixgenNode;
import inet.common.scenario.ScenarioManager;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.physicallayer.unitdisk.UnitDiskRadioMedium;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
import inet.common.oracle.Oracle;

network simpleNetwork
{
    parameters:
        int numHost = default(2);
        int sprayFraction = default(10);
        string networkType;
        bool backoffEnabled;
        bool mlEnable;
        int mlThreshold = default(300);
    submodules:
        Oracle: Oracle {
            parameters:
                @display("p=100,269;is=s");
        }
        visualizer: IntegratedCanvasVisualizer {
            parameters:
                @display("p=100,30;is=s");
        }
        radioMedium: UnitDiskRadioMedium {
            parameters:
                @display("p=99,128;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                addDefaultRoutes = false;
                addStaticRoutes = false;
                addSubnetRoutes = false;
                config = xml("<config><interface hosts='*' address='145.236.x.x' netmask='255.255.0.0'/></config>");
                @display("p=100,83;is=s");
        }
        routingTableRecorder: RoutingTableRecorder {
            parameters:
                @display("p=100,175;is=s");
        }
        scenarioManager: ScenarioManager {
            parameters:
                script = default(xml("<scenario/>"));
                @display("p=100,221;is=s");
        }
                host[numHost]: sixgenNode {
                    parameters:
                        @display("p=300,300");
                }
//        host0: sixgenNode {
//            parameters:
//                @display("p=175,300");
//        }
//        host1: sixgenNode {
//            parameters:
//                @display("p=300,500");
//        }
//        host2: sixgenNode {
//            parameters:
//                @display("p=300,100");
//        }
//        host3: sixgenNode {
//            parameters:
//                @display("p=500,300");
//        }
//        host4: sixgenNode {
//            parameters:
//                @display("p=700,300");
//        }
    connections allowunconnected:
}
