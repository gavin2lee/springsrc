/**
 * This file is part of mnisqm-test.
 *
 * mnisqm-test is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * mnisqm-test is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with mnisqm-test.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.lachesis.mnisqm.test.rule;

import org.eclipse.jetty.annotations.AnnotationConfiguration;
import org.eclipse.jetty.plus.webapp.EnvConfiguration;
import org.eclipse.jetty.plus.webapp.PlusConfiguration;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.Configuration;
import org.eclipse.jetty.webapp.FragmentConfiguration;
import org.eclipse.jetty.webapp.MetaInfConfiguration;
import org.eclipse.jetty.webapp.WebAppContext;
import org.eclipse.jetty.webapp.WebInfConfiguration;
import org.eclipse.jetty.webapp.WebXmlConfiguration;
import org.junit.rules.TestRule;
import org.junit.runner.Description;
import org.junit.runners.model.Statement;

import com.lachesis.mnisqm.test.TestException;
import com.lachesis.mnisqm.test.WebServer;

/**
 * @author Paul Xu.
 * @since 1.0.0
 */
public class ServerLifecycleRule implements TestRule {

    @Override
    public Statement apply(Statement base, Description description) {
        if (description.getAnnotation(WebServer.class) != null) {
            return new WrappedStatement(base);
        } else {
            return base;
        }
    }

    private static class WrappedStatement extends Statement {
        private Server server;
        private Statement baseStm;

        WrappedStatement(Statement base) {
            this.baseStm = base;
        }

        private void setUp() {
            server = new Server(8080);
            WebAppContext context = new WebAppContext();
            context.setDescriptor("src/test/webapp/WEB-INF/web.xml");
            context.setResourceBase("src/test/webapp");
            context.setContextPath("/");
            context.setParentLoaderPriority(true);

            context.setServer(server);
            context.setConfigurations(new Configuration[]{
                    new AnnotationConfiguration(), new WebXmlConfiguration(),
                    new WebInfConfiguration(), new PlusConfiguration(),
                    new MetaInfConfiguration(), new FragmentConfiguration(),
                    new EnvConfiguration()});

            try {
                server.start();
            } catch (Exception e) {
                throw new TestException(e);
            }
        }

        private void tearDown() {
            if (server != null) {
                try {
                    server.stop();
                    server.join();
                    server.destroy();
                    server = null;
                } catch (Exception e) {
                    throw new TestException(e);
                }
            }
        }

        @Override
        public void evaluate() throws Throwable {
            setUp();
            baseStm.evaluate();
            tearDown();

        }
    }

}