package org.openas2.processor.resender;

import org.openas2.OpenAS2Exception;
import org.openas2.message.Message;
import org.openas2.processor.BaseActiveModule;

import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;


public abstract class BaseResenderModule extends BaseActiveModule implements ResenderModule {
    public static final int TICK_INTERVAL = 30 * 1000;
    private Timer timer;

    public abstract void resend();

    // The resender module, though permanently active, does need to be targeted to request handling a resend
    public boolean canHandle(String action, Message msg, Map<String, Object> options) {
        return action.equalsIgnoreCase(getModuleAction());
    }

    public void doStart() throws OpenAS2Exception {
        timer = new Timer(getName(), true);
        timer.scheduleAtFixedRate(new PollTask(), 0, TICK_INTERVAL);
    }

    public void doStop() throws OpenAS2Exception {
        if (timer != null) {
            timer.cancel();
            timer = null;
        }
    }

    private class PollTask extends TimerTask {
        public void run() {
            resend();
        }
    }
}
