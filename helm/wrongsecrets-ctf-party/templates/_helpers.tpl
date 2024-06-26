{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "wrongsecrets-ctf-party.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wrongsecrets-ctf-party.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wrongsecrets-ctf-party.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "wrongsecrets-ctf-party.labels" -}}
helm.sh/chart: {{ include "wrongsecrets-ctf-party.chart" . }}
{{ include "wrongsecrets-ctf-party.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: Helm
meta.helm.sh/release-name: {{ .Release.Name }}
meta.helm.sh/release-namespace: {{ .Release.Namespace }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "wrongsecrets-ctf-party.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wrongsecrets-ctf-party.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "wrongsecrets-ctf-party.cookieName" -}}
{{- if .Values.balancer.cookie.secure -}}
{{- printf "__Secure-%s" .Values.balancer.cookie.name -}}
{{- else -}}
{{- printf "%s" .Values.balancer.cookie.name -}}
{{- end -}}
{{- end -}}
