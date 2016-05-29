#!/usr/bin/python
# encoding: utf-8

import SocketServer
import SimpleHTTPServer
import urlparse
import urllib
import os

PORT = (ord('y') << 8) + (ord('u') << 4) + ord('m') # 32957

WORK_DIR = os.path.dirname(os.path.realpath(__file__)) 
os.chdir(WORK_DIR)

class Proxy(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def do_GET(self, onlyheader = False):
        path = str(self.path)
        pathinfo = urlparse.urlparse(path)
        filepath = pathinfo.path
        filename = os.path.basename(filepath)

        if filename.endswith('.rpm') :
            return self.do_PROXY(filename, onlyheader)
        elif os.path.isfile("./" + filepath):
            f = self.send_head()
            if f and not onlyheader:
                self.copyfile(f, self.wfile)
            return

        self.send_response(404)


    def do_HEAD(self):
        self.do_GET(True)


    def do_PROXY(self, filename, onlyheader = False):
        mirrors = [
            "http://mirrors.aliyun.com/centos/7/updates/x86_64/Packages/",
            "http://mirrors.aliyun.com/centos/7/os/x86_64/Packages/",
            "http://vault.centos.org/7.2.1511/updates/x86_64/Packages/",
            "http://vault.centos.org/7.2.1511/os/x86_64/Packages/",
        ]

        source = None
        for mirror in mirrors:
            source = urllib.urlopen(mirror + filename)
            if source.getcode() is 200:
                break

        if source is None or source.getcode() != 200:
            self.send_response(404)
            return

        self.log_request(200)

        self.wfile.write("%s %d %s\r\n" %(self.protocol_version, 200, self.responses[200][0]))
        self.wfile.write(source.info())
        self.wfile.write("\r\n")

        if onlyheader:
            return

        self.copyfile(source, self.wfile)


SocketServer.TCPServer.allow_reuse_address = True
httpd = SocketServer.ForkingTCPServer(('', PORT), Proxy)
httpd.allow_reuse_address = True

print "serving at port", PORT

httpd.serve_forever()
